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
    chapter = epub.EpubHtml(title=chapter_title, file_name=f'chap_{idx:02}.xhtml', lang=lang)
    chapter.content = data["sub"]
    chapter.content += "\n".join([c for c in data["content"]])
    book.add_item(chapter)
    book.toc.append(epub.Link(f'chap_{idx:02}.xhtml', chapter_title, f'chap_{idx:02}'))
    book.spine.append(chapter)


def save_epub(book, doc):
    book.add_item(epub.EpubNcx())
    book.add_item(epub.EpubNav())
    pope_id = doc["pope_name"].replace(' ', '-')
    doc_id = f'{doc["type"]}-{doc["date"]}-{doc["doc_name"]}'
    base_path = f'documents/{pope_id}/{doc["language"]}'
    epub_filename = f'{base_path}/{doc_id}.epub'
    os.makedirs(base_path, exist_ok=True)
    epub.write_epub(epub_filename, book, {})
    print(f"ePub '{doc['name']}' criado com sucesso em '{epub_filename}'!")
    index.append({
        "id": doc_id,
        "pope_id": pope_id,
        "path": epub_filename.replace("documents/", "https://emersonalmeida.wtf/pontifex_archive/")
    } | doc)


def create_epub(doc, chapters):
    book = epub.EpubBook()

    book.set_title(doc["name"])
    book.add_author(doc["pope_name"])

    for i, (chapter_title, data) in enumerate(chapters.items(), 1):
        add_chapter(book, chapter_title, data, doc["language"], i)

    save_epub(book, doc)


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
    }
]

if __name__ == "__main__":
    process_documents(documents)