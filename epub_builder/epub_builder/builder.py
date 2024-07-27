from bs4 import BeautifulSoup
import requests
from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;
from . import epub
import os
import re
import sqlite3

def generate():
    database_path = f"{os.path.dirname(__file__)}/../../api/data/search.sqlite"
    if os.path.exists(database_path):
        os.remove(database_path)
    con = sqlite3.connect(database_path)
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS chapters(id TEXT PRIMARY KEY, document_id TEXT, document_name TEXT, title TEXT, content TEXT, language_code TEXT, version TEXT);")
    cur.execute("CREATE VIRTUAL TABLE IF NOT EXISTS search USING FTS5(id UNINDEXED, content, content='chapters');")
    cur.execute("CREATE TRIGGER update_search AFTER INSERT ON chapters BEGIN INSERT INTO search(id, content) VALUES (new.id, new.content); END;")



    _popes = popes.all()
    for pope in _popes:
        for document in pope.documents:
            document.type = "enc"
            document.author_id = pope.id
            for document_translation in document.translations:
                document_translation.id = f"{document_translation.language_code}/{document.id}"
                document_translation.epub_url = f"https://pontifexarchive.leigo.fm/api/popes/{pope.id}/{document_translation.id}.epub"

                scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url, pope.signatures)
                scraper.run()

                scraper.index_it(cur, document, document_translation)

                structures.save(document_translation, scraper.structure)
                epub.create(pope, document, document_translation, scraper.structure)

        url = f"https://www.vatican.va/content/{pope.id}/en/encyclicals.index.html"
        root = _rootElement(url);
        if root is not None:
            for document_root in root.select('li .item'):
                h1 = document_root.select_one('h1')
                translations = [{
                        "language_code": to_language(l.text),
                        "vatican_url": f"https://www.vatican.va{l['href']}"
                    } for l in document_root.select('h2 a')];

                title = re.search(r'^ ?(.+) \((.+) (\d{,2}), (\d{4})\)', h1.text.replace('\xa0', ' '))

                if title:
                    data = [group.replace('\r', '') for group in title.groups()]
                    if len(translations) > 0:
                        url = translations[0]['vatican_url']
                        url_parts = url.split("_")
                        id_part = url_parts[len(url_parts) - 1].replace('.html', '')
                        d_id = f"enc-{data[3]}{to_month(data[1])}{data[2]}-{id_part}"
                        if len([d for d in pope.documents if d.id == d_id]) == 0:
                            pope.documents.append({
                                "id": d_id,
                                "authorId": pope.id,
                                "name": data[0],
                                "date": f"{data[3]}-{to_month(data[1])}-{data[2]}",
                                "type": "enc",
                                "translations": translations,
                                "cover_url": "https://pontifexarchive.leigo.fm/api/covers/fallback.png",
                                "author_id": pope.id
                            })
                else:
                    print(h1)

    con.commit()
    cur.close()
    popes.save(_popes)

def to_language(language):
    if language == 'English':
        return 'en'
    elif language == 'Italian':
        return 'it'
    elif language == 'Latin':
        return 'la'
    elif language == 'Portuguese':
        return 'pt'
    elif language == 'French':
        return 'fr'
    elif language == 'German':
        return 'de'
    elif language == 'Spanish':
        return 'es'
    elif language == 'Hungarian':
        return 'hu'
    else:
        raise BaseException(f"error '{language}'")

def to_month(month):
    return {
        'January': '01',
        'February': '02',
        'March': '03',
        'April': '04',
        'May': '05',
        'June': '06',
        'July': '07',
        'August': '08',
        'September': '09',
        'October': '10',
        'November': '11',
        'December': '12'
    }[month.replace(r' ','')]

def _rootElement(url):
    return _buildSoup(url).select_one(".documento .vaticanindex")

def _buildSoup(url):
    return BeautifulSoup(_fetchHTML(url), 'html.parser')

def _fetchHTML(url):
    return requests.get(url).content


def roman_to_i(s):
    roman = {'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000,'IV':4,'IX':9,'XL':40,'XC':90,'CD':400,'CM':900}
    i = 0
    num = 0
    while i < len(s):
        if i+1<len(s) and s[i:i+2] in roman:
            num+=roman[s[i:i+2]]
            i+=2
        else:
            num+=roman[s[i]]
            i+=1
    return num if num > 9 else f"0{num}"