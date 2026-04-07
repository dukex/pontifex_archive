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

.cover-langs {
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


def _read_structure(data_pt_path, doc_id):
    path = os.path.join(data_pt_path, f"{doc_id}.json")
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def _doc_date_from_id(doc_id):
    # Format: enc-DDMMYYYY-name  e.g. enc-15051891-rerum-novarum
    parts = doc_id.split("-")
    if len(parts) < 2:
        return ""
    raw = parts[1]
    if len(raw) == 8:
        return f"{raw[0:2]}/{raw[2:4]}/{raw[4:8]}"
    return ""


def _render_document(doc_id, doc_name, structure):
    date_str = _doc_date_from_id(doc_id)
    html = f'<section class="document-section">\n'
    html += f'  <div class="document-title">\n'
    html += f'    <h3>{doc_name}</h3>\n'
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


def create(root_path, popes):
    data_pt_path = os.path.join(root_path, "api", "data", "pt")
    output_path = os.path.join(root_path, "api", "encyclicals-pt.pdf")

    body = '<div class="cover">\n'
    body += '  <div class="cover-eyebrow">Pontifex Archive</div>\n'
    body += '  <h1>Encíclicas<br>Pontifícias</h1>\n'
    body += '  <div class="cover-subtitle">De Leão XIII a Francisco</div>\n'
    body += '  <hr class="cover-rule">\n'
    body += '  <div class="cover-langs">Português</div>\n'
    body += '</div>\n'

    # popes.json lists newest-first; reverse for chronological order
    for pope in reversed(popes):
        has_pt_docs = any(
            any(t.language_code == "pt" for t in doc.translations)
            for doc in pope.documents
        )
        if not has_pt_docs:
            continue

        body += f'<section class="pope-section">\n'
        body += f'  <div class="pope-header"><h2>{pope.name}</h2></div>\n'

        # sort documents chronologically by date in their id
        sorted_docs = sorted(pope.documents, key=lambda d: d.id)
        for doc in sorted_docs:
            if not any(t.language_code == "pt" for t in doc.translations):
                continue
            structure = _read_structure(data_pt_path, doc.id)
            if structure is None:
                print(f"  [aviso] estrutura não encontrada para {doc.id}, pulando")
                continue
            body += _render_document(doc.id, doc.name, structure)

        body += '</section>\n'

    full_html = f"""<!DOCTYPE html>
<html lang="pt">
<head><meta charset="utf-8"><title>Encíclicas Pontifícias</title></head>
<body>
{body}
</body>
</html>"""

    print("Gerando PDF...")
    HTML(string=full_html).write_pdf(output_path, stylesheets=[_CSS])
    print(f"PDF gerado em '{output_path}'")
