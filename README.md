# Pontifex Archive

## Download

[![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://play.google.com/store/apps/details?id=fm.leigo.pontifex_archive)
[![Firefox](https://img.shields.io/badge/Firefox-FF7139?style=for-the-badge&logo=Firefox-Browser&logoColor=white)](https://pontifexarchive.leigo.fm/)
[![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)](https://pontifexarchive.leigo.fm/)
[![Safari](https://img.shields.io/badge/Safari-000000?style=for-the-badge&logo=Safari&logoColor=white)](https://pontifexarchive.leigo.fm/)

Read a comprehensive collection of papal documents and church writings.

## Structures

- `/app` - This is the flutter app. Basically an epub reader.
- `/api` - This is a static api used through the Github Pages.
  - `/popes.json` - This file is almost totally created and updated manually, has the Popes informations and the pope documents.
  - `/covers/*.png` - Has non-offical covers for documents.
  - `/data/[language]/*.json` - These files are the document snapshot extracted from vatican website, the scraper script try to detect some document parts as notes, pope signature, chapters, etc to create a better document to read.
- `/epub_builder` - A python package, using poetry, to web scrape the vatican website and create a epub.

