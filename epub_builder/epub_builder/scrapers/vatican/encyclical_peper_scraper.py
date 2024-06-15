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
    def __init__(self, name, url) -> None:
        self._url = url
        self._name = name
        self._chapters = {}

    @property
    def structure(self):
        return self._chapters;

    def run(self):
        print(f"running {self._name}")
        current_chapter = self._name.upper()
        last_chapter = current_chapter
        elements = self._allParagraphs()

        for element in elements:
            if is_letter_chapter_title(element):
                if is_a_new_chapter(last_chapter, current_chapter, self._chapters):
                    current_chapter = element.text.strip()
                else:
                    self._add_chapter(current_chapter, subtitle=str(element))
            else:
                last_chapter = current_chapter
                self._add_chapter(current_chapter, content=str(element))

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
