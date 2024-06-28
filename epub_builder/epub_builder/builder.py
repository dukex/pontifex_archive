from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;
from . import epub
import os
import sqlite3

def generate():
    _popes = popes.all()
    database_path = f"{os.path.dirname(__file__)}/../../api/data/database.sqlite"
    if os.path.exists(database_path):
        os.remove(database_path)
    con = sqlite3.connect(database_path)
    cur = con.cursor()
    cur.execute("CREATE VIRTUAL TABLE IF NOT EXISTS chapters USING FTS5(document_id, document_name, title, body, language_code);")

    for pope in _popes:
        for document in pope.documents:
            for document_translation in document.translations:
                scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url, pope.signatures)
                scraper.run()

                scraper.index_it(cur, document, document_translation)

                structures.save(document_translation, scraper.structure)
                epub.create(pope, document, document_translation, scraper.structure)
    con.commit()
    cur.close()
    popes.save(_popes)