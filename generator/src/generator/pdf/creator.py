import json
import os
from weasyprint import HTML, CSS


_CSS = CSS(string="""
@page {
    size: A4;
    margin: 2.5cm 2.5cm 3cm 2.5cm;
    @bottom-center {
        content: counter(page);
        font-family: 'Georgia', serif;
        font-size: 10pt;
        color: #555;
    }
}

@page cover-page {
    margin: 0;
    @bottom-center { content: none; }
}

body {
    font-family: 'Georgia', serif;
    font-size: 11pt;
    line-height: 1.7;
    color: #1a1a1a;
}

/* Cover */
.cover {
    page: cover-page;
    page-break-after: always;
    background-color: #2b1200;
    width: 210mm;
    height: 297mm;
    text-align: center;
    padding-top: 90mm;
    box-sizing: border-box;
}

.cover-eyebrow {
    font-size: 9pt;
    letter-spacing: 0.25em;
    text-transform: uppercase;
    color: #b07040;
    margin-bottom: 1.2cm;
}

.cover h1 {
    font-size: 32pt;
    font-weight: normal;
    letter-spacing: 0.08em;
    color: #f5e8d0;
    margin: 0 0 0.4cm;
    text-transform: uppercase;
}

.cover-subtitle {
    font-size: 13pt;
    font-style: italic;
    color: #c49060;
    margin-bottom: 1.5cm;
}

.cover-rule {
    width: 5cm;
    border: none;
    border-top: 1px solid #7a4010;
    margin: 0 auto 1.2cm;
}

.cover-volume {
    font-size: 9pt;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: #7a5030;
}

/* Pope section */
.pope-section {
    page-break-before: always;
}

.pope-header {
    text-align: center;
    padding: 3cm 0 2cm;
    page-break-after: avoid;
}

.pope-header h2 {
    font-size: 20pt;
    font-weight: normal;
    letter-spacing: 0.1em;
    color: #3b1f0a;
    text-transform: uppercase;
}

/* Document */
.document-section {
    page-break-before: always;
}

.document-title {
    text-align: center;
    padding: 2cm 0 1.5cm;
    page-break-after: avoid;
}

.document-title h3 {
    font-size: 16pt;
    font-weight: normal;
    font-style: italic;
    color: #663300;
    margin-bottom: 0.3cm;
}

.document-title .doc-date {
    font-size: 10pt;
    color: #888;
    letter-spacing: 0.05em;
}

/* Chapter */
.chapter {
    margin-bottom: 1.5cm;
}

.chapter-title {
    font-size: 12pt;
    font-weight: bold;
    color: #3b1f0a;
    text-align: center;
    margin: 1cm 0 0.5cm;
    page-break-after: avoid;
}

.chapter-subtitle {
    text-align: center;
    margin-bottom: 0.5cm;
    color: #663300;
    page-break-after: avoid;
}

/* Body paragraphs */
p {
    text-align: justify;
    margin: 0 0 0.4cm;
    text-indent: 0.7cm;
}

p:first-child {
    text-indent: 0;
}

/* Clean up legacy HTML attributes */
font { color: inherit; }
""")


def _read_books(root_path):
    path = os.path.join(root_path, "api", "data", "books.json")
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def _read_structure(root_path, language_code, doc_id):
    path = os.path.join(root_path, "api", "data", language_code, f"{doc_id}.json")
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def _format_date(doc):
    date = getattr(doc, "date", None)
    if not date:
        return ""
    parts = date.split("-")
    if len(parts) == 3:
        return f"{parts[2]}/{parts[1]}/{parts[0]}"
    return date


def _render_cover(volume):
    return (
        f'<div class="cover">\n'
        f'  <div class="cover-eyebrow">Pontifex Archive</div>\n'
        f'  <h1>Encíclicas<br>Pontifícias</h1>\n'
        f'  <div class="cover-subtitle">{volume["subtitle"]}</div>\n'
        f'  <hr class="cover-rule">\n'
        f'  <div class="cover-volume">{volume["title"]}</div>\n'
        f'</div>\n'
    )


def _render_document(root_path, language_code, doc):
    structure = _read_structure(root_path, language_code, doc.id)
    if not structure:
        print(f"  [aviso] sem conteúdo para {doc.id}, pulando")
        return ""

    date_str = _format_date(doc)
    html = f'<section class="document-section">\n'
    html += f'  <div class="document-title">\n'
    html += f'    <h3>{doc.name}</h3>\n'
    if date_str:
        html += f'    <div class="doc-date">{date_str}</div>\n'
    html += f'  </div>\n'

    for chapter_title, data in structure.items():
        html += f'  <div class="chapter">\n'
        html += f'    <div class="chapter-title">{chapter_title}</div>\n'
        subtitle = data.get("subtitle", "")
        if subtitle:
            html += f'    <div class="chapter-subtitle">{subtitle}</div>\n'
        for paragraph in data.get("content", []):
            html += f'    {paragraph}\n'
        html += f'  </div>\n'

    html += '</section>\n'
    return html


def _docs_for_section(pope, section):
    date_from = section.get("date_from")
    date_to = section.get("date_to")

    docs = [
        doc for doc in pope.documents
        if any(t.language_code == section.get("language", "pt") for t in doc.translations)
    ]

    if date_from:
        docs = [d for d in docs if getattr(d, "date", "") >= date_from]
    if date_to:
        docs = [d for d in docs if getattr(d, "date", "") <= date_to]

    return sorted(docs, key=lambda d: getattr(d, "date", d.id))


def _generate_volume(root_path, volume, popes_by_id):
    language = volume.get("language", "pt")
    body = _render_cover(volume)

    for section in volume["sections"]:
        pope_id = section["pope"]
        pope = popes_by_id.get(pope_id)
        if pope is None:
            print(f"  [aviso] papa '{pope_id}' não encontrado, pulando seção")
            continue

        docs = _docs_for_section(pope, {**section, "language": language})
        if not docs:
            print(f"  [aviso] nenhum documento PT para '{pope_id}' nesta seção")
            continue

        body += f'<section class="pope-section">\n'
        body += f'  <div class="pope-header"><h2>{pope.name}</h2></div>\n'
        for doc in docs:
            body += _render_document(root_path, language, doc)
        body += '</section>\n'

    full_html = (
        f'<!DOCTYPE html>\n<html lang="{language}">\n'
        f'<head><meta charset="utf-8"><title>{volume["title"]}</title></head>\n'
        f'<body>\n{body}</body>\n</html>'
    )

    output_dir = os.path.join(root_path, "api", "books")
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f'{volume["id"]}.pdf')

    print(f'Gerando {volume["id"]}...')
    HTML(string=full_html).write_pdf(output_path, stylesheets=[_CSS])
    print(f'  -> {output_path}')


def create(root_path, popes, volume_id=None):
    books = _read_books(root_path)
    popes_by_id = {p.id: p for p in popes}

    volumes = books if volume_id is None else [v for v in books if v["id"] == volume_id]

    if not volumes:
        print(f"Volume '{volume_id}' não encontrado em books.json")
        return

    for volume in volumes:
        _generate_volume(root_path, volume, popes_by_id)
