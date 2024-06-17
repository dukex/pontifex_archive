from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;
from . import epub

def generate():
  for pope in popes.all():
    for document in pope.documents:
      for document_translation in document.translations:
        scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url, pope.signatures)
        scraper.run()

        structures.save(document_translation, scraper.structure)
        epub.create(pope, document, document_translation, scraper.structure)