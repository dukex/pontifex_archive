import os
from ebooklib import epub

def create(root_path, author, document, document_translation, structure):
    file_path = f"{root_path}/popes/{author.id}/{document_translation.id}.epub"

    os.makedirs(os.path.dirname(file_path), exist_ok=True)

    image_path = f"{root_path}/covers/{document.id}.png" if os.path.exists(f"{root_path}/covers/{document.id}.png") else f"{root_path}/covers/fallback.png"

    document.cover_url = image_path.replace(root_path, "https://pontifexarchive.leigo.fm/api")

    if not os.path.exists(file_path):
        book = epub.EpubBook()
        book.set_title(document.name)
        book.add_author(author.name)
        if os.path.exists(f"{root_path}/covers/{document.id}.png"):
            book.set_cover("image.jpg", open(f"{root_path}/covers/{document.id}.png", 'rb').read())

        for i, (title, data) in enumerate(structure.items(), 1):
            _add_chapter(book, title, data, document_translation.language_code, i)

        book.add_item(epub.EpubNcx())
        book.add_item(epub.EpubNav())
        epub.write_epub(file_path, book, {})
        print(f"ePub '{document.name}' criado com sucesso em '{file_path}'!")

def _add_chapter(book, chapter_title, data, lang, idx):
    id = f'chapter_{idx:02}'
    file_name = f'{id}.xhtml'

    chapter = epub.EpubHtml(title=chapter_title, file_name=file_name, lang=lang, uid=id)
    chapter.content = data["subtitle"]
    chapter.content += "\n".join([c for c in data["content"]])
    book.add_item(chapter)
    book.toc.append(epub.Link(file_name, chapter_title, id))
    book.spine.append(chapter)