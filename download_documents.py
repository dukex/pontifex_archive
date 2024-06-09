from itertools import groupby
import json
import os
import re
import requests
from typing import Dict, List
from bs4 import BeautifulSoup
from ebooklib import epub

index = []

bad_chapter_name_pattern = re.compile(r'^\d+\.|.+edn.+$', re.IGNORECASE)


def is_valid_chapter_name(name):
    return not bad_chapter_name_pattern.match(name)


def extract_text_and_chapters(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    document_div = soup.find('div', class_='documento')

    chapters = {}
    current_chapter = "LETTER"
    last_chapter = "LETTER"

    for elem in document_div.find_all(['p']):
        if len(elem.text.strip()) > 0:
            if elem.has_attr('align') and elem.attrs['align'] == 'center':
                if last_chapter in chapters and current_chapter == last_chapter:
                    current_chapter = elem.text.strip()
                else:
                    if current_chapter not in chapters:
                        chapters[current_chapter] = {"sub": "", "content": []}

                    chapters[current_chapter]["sub"] += ''.join(map(str, elem.contents)).strip()
            else:
                last_chapter = current_chapter
                if current_chapter not in chapters:
                    chapters[current_chapter] = {"sub": "", "content": []}

                chapters[current_chapter]["content"].append(str(elem))

    return chapters


def add_chapter(book, chapter_title, data, lang, idx):
    id = f'chapter_{idx:02}'
    file_name = f'${id}.xhtml'

    chapter = epub.EpubHtml(title=chapter_title, file_name=file_name, lang=lang, uid=id)
    chapter.content = data["sub"]
    chapter.content += "\n".join([c for c in data["content"]])
    book.add_item(chapter)
    book.toc.append(epub.Link(file_name, chapter_title, id))
    book.spine.append(chapter)


def save_epub(id, pope_id, book, doc, file_path):
    book.add_item(epub.EpubNcx())
    book.add_item(epub.EpubNav())
    epub.write_epub(file_path, book, {})
    print(f"ePub '{doc['name']}' criado com sucesso em '{file_path}'!")


def create_epub(doc, chapters):
    pope_id = doc["pope_name"].replace(' ', '-')
    doc_id = f'{doc["type"]}-{doc["date"]}-{doc["doc_name"]}'

    base_path = f'documents/{pope_id}/{doc["language"]}'
    os.makedirs(base_path, exist_ok=True)

    file_path =f'{base_path}/{doc_id}.epub'

    if not os.path.exists(file_path):
        book = epub.EpubBook()

        book.set_title(doc["name"])
        book.add_author(doc["pope_name"])

        for i, (chapter_title, data) in enumerate(chapters.items(), 1):
            add_chapter(book, chapter_title, data, doc["language"], i)

        save_epub(doc_id, pope_id, book, doc, file_path)

    index.append({
          "id": doc_id,
          "pope_id": pope_id,
          "path": file_path.replace("documents/", "https://emersonalmeida.wtf/pontifex_archive/")
      } | doc)


def save_index():
    documents_index = []

    for id, edocs in groupby(index, key=lambda x: x['id']):
        docs = list(edocs)
        la = list(filter(lambda x: x["language"] == "la", docs))[0]

        documents_index.append({
            'id': id,
            'pope': {
                'id': la['pope_id'],
                'name': la['pope_name'],
            },
            'date': la['date'],
            'type': la['type'],
            'url': la["path"],
            'name': la['name'],
            'translations': [{
                'language': doc['language'],
                'name': doc['name'],
                'url': doc["path"]
            } for doc in list(docs)]
        })

    with open("documents/documents.json", 'w', encoding='utf-8') as f:
        json.dump(documents_index, f, ensure_ascii=False, indent=4)


def process_documents(documents: List[Dict]):
    for doc in documents:
        chapters = extract_text_and_chapters(doc['url'])
        create_epub(doc, chapters)
    save_index()


documents = [
    {
        "url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html",
        "name": "Caritas in veritate",
        "pope_name": "Benedictus XVI",
        "date": "20090629",
        "doc_name": "caritas_in_veritate",
        "language": "en",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/la/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html",
        "name": "Caritas in veritate",
        "pope_name": "Benedictus XVI",
        "date": "20090629",
        "doc_name": "caritas_in_veritate",
        "language": "la",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/pt/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html",
        "name": "Caritas in veritate",
        "pope_name": "Benedictus XVI",
        "date": "20090629",
        "doc_name": "caritas_in_veritate",
        "language": "pt",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20071130_spe-salvi.html",
        "name": "Spe salvi",
        "pope_name": "Benedictus XVI",
        "date": "20071130",
        "doc_name": "spe_salvi",
        "language": "en",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/la/encyclicals/documents/hf_ben-xvi_enc_20071130_spe-salvi.html",
        "name": "Spe salvi",
        "pope_name": "Benedictus XVI",
        "date": "20071130",
        "doc_name": "spe_salvi",
        "language": "la",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/pt/encyclicals/documents/hf_ben-xvi_enc_20071130_spe-salvi.html",
        "name": "Spe salvi",
        "pope_name": "Benedictus XVI",
        "date": "20071130",
        "doc_name": "spe_salvi",
        "language": "pt",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20051225_deus-caritas-est.html",
        "name": "Deus caritas est",
        "pope_name": "Benedictus XVI",
        "date": "20051225",
        "doc_name": "deus_caritas_est",
        "language": "en",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/la/encyclicals/documents/hf_ben-xvi_enc_20051225_deus-caritas-est.html",
        "name": "Deus caritas est",
        "pope_name": "Benedictus XVI",
        "date": "20051225",
        "doc_name": "deus_caritas_est",
        "language": "la",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/benedict-xvi/pt/encyclicals/documents/hf_ben-xvi_enc_20051225_deus-caritas-est.html",
        "name": "Deus caritas est",
        "pope_name": "Benedictus XVI",
        "date": "20051225",
        "doc_name": "deus_caritas_est",
        "language": "pt",
        "type": "enc"
    },
     {
        "url": "https://www.vatican.va/content/francesco/la/encyclicals/documents/papa-francesco_20130629_enciclica-lumen-fidei.html",
        "name": "Lumen fidei",
        "pope_name": "Franciscus",
        "date": "20130524",
        "doc_name": "lumen_fidei",
        "language": "la",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/en/encyclicals/documents/papa-francesco_20130629_enciclica-lumen-fidei.html",
        "name": "Lumen fidei",
        "pope_name": "Franciscus",
        "date": "20130524",
        "doc_name": "lumen_fidei",
        "language": "en",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/pt/encyclicals/documents/papa-francesco_20130629_enciclica-lumen-fidei.html",
        "name": "Lumen fidei",
        "pope_name": "Franciscus",
        "date": "20130524",
        "doc_name": "lumen_fidei",
        "language": "pt",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/la/encyclicals/documents/papa-francesco_20150524_enciclica-laudato-si.html",
        "name": "Laudato si'",
        "pope_name": "Franciscus",
        "date": "20150524",
        "doc_name": "laudato_si",
        "language": "la",
        "type": "enc"
    },
     {
        "url": "https://www.vatican.va/content/francesco/pt/encyclicals/documents/papa-francesco_20150524_enciclica-laudato-si.html",
        "name": "Laudato si'",
        "pope_name": "Franciscus",
        "date": "20150524",
        "doc_name": "laudato_si",
        "language": "pt",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/en/encyclicals/documents/papa-francesco_20150524_enciclica-laudato-si.html",
        "name": "Laudato si'",
        "pope_name": "Franciscus",
        "date": "20150524",
        "doc_name": "laudato_si",
        "language": "en",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/la/encyclicals/documents/papa-francesco_20201003_enciclica-fratelli-tutti.html",
        "name": "Fratelli tutti",
        "pope_name": "Franciscus",
        "date": "20201003",
        "doc_name": "fratelli_tutti",
        "language": "la",
        "type": "enc"
    },
      {
        "url": "https://www.vatican.va/content/francesco/pt/encyclicals/documents/papa-francesco_20201003_enciclica-fratelli-tutti.html",
        "name": "Fratelli tutti",
        "pope_name": "Franciscus",
        "date": "20201003",
        "doc_name": "fratelli_tutti",
        "language": "pt",
        "type": "enc"
    },
    {
        "url": "https://www.vatican.va/content/francesco/en/encyclicals/documents/papa-francesco_20201003_enciclica-fratelli-tutti.html",
        "name": "Fratelli tutti",
        "pope_name": "Franciscus",
        "date": "20201003",
        "doc_name": "fratelli_tutti",
        "language": "en",
        "type": "enc"
    }
]

if __name__ == "__main__":
    process_documents(documents)