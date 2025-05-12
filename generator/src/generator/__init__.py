from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;
from . import epub
import os
import sqlite3

def main():
    root_path = f"{os.path.dirname(__file__)}/../../.."
    database_path = f"{root_path}/api/data/search.sqlite"
    if os.path.exists(database_path):
        os.remove(database_path)

    _popes = popes.all(root_path)

    con = sqlite3.connect(database_path)
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS chapters(id TEXT PRIMARY KEY, document_id TEXT, document_name TEXT, title TEXT, content TEXT, language_code TEXT, version TEXT);")
    cur.execute("CREATE VIRTUAL TABLE IF NOT EXISTS search USING FTS5(id UNINDEXED, content, content='chapters');")
    cur.execute("CREATE TRIGGER update_search AFTER INSERT ON chapters BEGIN INSERT INTO search(id, content) VALUES (new.id, new.content); END;")

    for pope in _popes:
        for document in pope.documents:
            document.author_id = pope.id
            for document_translation in document.translations:
                document_translation.id = f"{document_translation.language_code}/{document.id}"
                document_translation.epub_url = f"https://pontifexarchive.leigo.fm/api/popes/{pope.id}/{document_translation.id}.epub"

                scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url, pope.signatures)
                scraper.run()

                scraper.index_it(cur, document, document_translation)

                structures.save(root_path, document_translation, scraper.structure)
                epub.create(root_path + "/api", pope, document, document_translation, scraper.structure)

    con.commit()
    cur.close()
    popes.save(root_path, _popes)