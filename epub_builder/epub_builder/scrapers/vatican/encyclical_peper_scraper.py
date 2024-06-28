from bs4 import BeautifulSoup
import requests
import re

def has_content(element):
    return len(re.sub(r"\W", "", element.text.strip())) > 0

def is_letter_chapter_title(element):
    return (
        element.has_attr('align') and element.attrs['align'].lower() == 'center'
    ) or (
        element.has_attr('style') and element.attrs['style'].lower() == 'text-align: center;'
    )

def is_a_new_chapter(last_chapter, current_chapter, chapters):
    return last_chapter in chapters and current_chapter == last_chapter

class EncyclicalLetterScraper:
    def __init__(self, name, url, pope_signatures) -> None:
        self._url = url
        self._name = name
        self._pope_signatures = pope_signatures
        self._chapters = {}

    @property
    def structure(self):
        return self._chapters;

    def index_it(self, cur, document, document_translation):
        for (title, chapter) in self._chapters.items():
            if title != "NOTES":
                content = "\n".join([
                    BeautifulSoup(chapter['subtitle']).get_text(),
                    "\n".join([BeautifulSoup(c).get_text() for c in chapter['content']])
                ])

                cur.execute(f"INSERT INTO chapters(document_id, document_name, title, body, language_code) VALUES(?, ?, ?, ?, ?)", (document.id, document.name, title, content, document_translation.language_code))


    def run(self):
        print(f"running {self._name}")
        current_chapter = self._name.upper()
        last_chapter = current_chapter
        elements = self._allParagraphs()

        for element in elements:
            if is_letter_chapter_title(element) and current_chapter != "NOTES":
                if self._is_pope_signatures(element):
                    self._add_chapter(current_chapter, content=str(element))
                    current_chapter = "NOTES"
                elif is_a_new_chapter(last_chapter, current_chapter, self._chapters):
                    current_chapter = element.text.strip()
                else:
                    self._add_chapter(current_chapter, subtitle=str(element))
            else:
                last_chapter = current_chapter
                self._add_chapter(current_chapter, content=str(element))

    def _is_pope_signatures(self, element):
      text = element.text.strip().lower()
      signatures = [signature.lower() for signature in self._pope_signatures]

      return text in signatures

    def _add_chapter(self, name, subtitle=None, content=None):
        if name not in self._chapters:
            self._chapters[name] = {"subtitle": "", "content": []}

        if subtitle:
            self._chapters[name]["subtitle"] += subtitle
        if content:
            self._chapters[name]["content"].append(content)

    def _allParagraphs(self):
        return [element for element in self._rootElement().find_all(['p']) if has_content(element)]

    def _rootElement(self):
        return self._buildSoup().select_one(".documento div.parbase:not(.abstract)")

    def _buildSoup(self):
        return BeautifulSoup(self._fetchHTML(), 'html.parser')

    def _fetchHTML(self):
        return requests.get(self._url).content
