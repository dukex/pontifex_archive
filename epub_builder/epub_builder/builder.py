from .repositories import popes;
from .repositories import structures;
from .scrapers.vatican import EncyclicalLetterScraper;

def generate():
  for pope in popes.all():
    for document in pope.documents:
      for document_translation in document.translations:
        scraper = EncyclicalLetterScraper(document.name, document_translation.vatican_url)
        scraper.run()

        structures.save(document_translation, scraper.structure)
