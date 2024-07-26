from bs4 import BeautifulSoup
import requests
from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;
from . import epub
import os
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
    # for pope in _popes:
    #     for document in pope.documents:
    #         document.type = "enc"
    #         document.author_id = pope.id
    #         for document_translation in document.translations:
    #             document_translation.id = f"{document_translation.language_code}/{document.id}"
    #             document_translation.epub_url = f"https://pontifexarchive.leigo.fm/api/popes/{pope.id}/{document_translation.id}.epub"

    #             scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url, pope.signatures)
    #             scraper.run()

    #             scraper.index_it(cur, document, document_translation)

    #             structures.save(document_translation, scraper.structure)
    #             epub.create(pope, document, document_translation, scraper.structure)

    for url in [
        "https://www.vatican.va/content/pius-xii/en.html",
        "https://www.vatican.va/content/pius-xi/en.html",
        "https://www.vatican.va/content/benedict-xv/en.html",
        "https://www.vatican.va/content/pius-x/en.html",
        "https://www.vatican.va/content/leo-xiii/en.html"
    ]:
        root = _rootElement(url);
        infos = root.find_all('h2');

        s_date =  infos[1].text.split(".")

        pope =  {
            "number": 1111111,
            "id": "ioannes-pp-xxiii",
            "image_url": "",
            "name": root.find('h1').text,
            "personal_name": infos[0].text,
            "motto": "",
            "country": "",
            "start_date": s_date,
            "end_date": infos[2].text.split("."),
            "signatures": [],
            "translations": [],
            "documents": []
        }
        print(pope)



    con.commit()
    cur.close()
    popes.save(_popes)


def _rootElement(url):
    return _buildSoup(url).select_one(".infos .info")

def _buildSoup(url):
    return BeautifulSoup(_fetchHTML(url), 'html.parser')

def _fetchHTML(url):
    return requests.get(url).content
