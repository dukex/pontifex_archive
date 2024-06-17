# Pontifex Archive

This project is an idea to create a good app to read the vatican documents and others catholics books.

## Structures

- `/app` - This is the flutter app. Basically an epub reader.
- `/api` - This is a static api used through the Github Pages.
  - `/popes.json` - This file is almost totally created and updated manually, has the Popes informations and the pope documents.
  - `/covers/*.png` - Has non-offical covers for documents.
  - `/data/[language]/*.json` - These files are the document snapshot extracted from vatican website, the scraper script try to detect some document parts as notes, pope signature, chapters, etc to create a better document to read.
- `/epub_builder` - A python package, using poetry, to web scrape the vatican website and create a epub.

