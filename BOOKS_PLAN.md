# Plano de Volumes — Encíclicas Pontifícias

Cobertura: **Leão XIII (1891) → Francisco (2024)**
Idioma: **Português**
Formato: PDF, um volume por era
Estimativa: ~1.364 páginas em 5 volumes

> Nota: O Vaticano lista muitos documentos antigos no índice PT mas sem texto digitalizado.
> Apenas os documentos com conteúdo PT confirmado estão incluídos (77 de 135 totais).

---

## Volumes

| Volume | Título | Papas | Período | Docs | ~Páginas | Status |
|--------|--------|-------|---------|------|----------|--------|
| Vol. I | A Doutrina Social e a Guerra | Leão XIII · Pio X · Pio XI · Pio XII | 1891–1958 | 41 | ~420 | pronto |
| Vol. II | O Concílio e a Modernidade | João XXIII · Paulo VI | 1958–1968 | 15 | ~240 | pronto |
| Vol. III | João Paulo II — I | João Paulo II | 1979–1991 | 9 | ~248 | pronto |
| Vol. IV | João Paulo II — II | João Paulo II | 1993–2003 | 5 | ~204 | pronto |
| Vol. V | A Igreja no Século XXI | Bento XVI · Francisco | 2005–2024 | 7 | ~255 | pronto |

**Total: 77 documentos, ~1.364 páginas**

---

## Documentos por volume

### Vol. I — A Doutrina Social e a Guerra

**Leão XIII (1)**
- Rerum Novarum (1891)

**Pio X (1)**
- Pascendi Dominici Gregis (1907)

**Pio XI (5)**
- Quadragesimo Anno (1931)
- Non Abbiamo Bisogno (1931)
- Mit Brennender Sorge (1937)
- Divini Redemptoris (1937)
- Ingravescentibus Malis (1937)

**Pio XII (34)**
- Summi Pontificatus (1939)
- Sertum Laetitiae (1939)
- Saeculo Exeunte Octavo (1940)
- Mystici Corporis Christi (1943)
- Divino Afflante Spiritu (1943)
- Orientalis Ecclesiae (1944)
- Communium Interpretes Dolorum (1945)
- Quemadmodum (1946)
- Deiparae Virginis Mariae (1946)
- Fulgens Radiatur (1947)
- Mediator Dei (1947)
- Optatissima Pax (1947)
- Auspicia Quaedam (1948)
- In Multiplicibus Curis (1948)
- Anni Sacri (1950)
- Summi Maeroris (1950)
- Humani Generis (1950)
- Mirabile Illud (1950)
- Evangelii Praecones (1951)
- Sempiternus Rex Christus (1951)
- Ingruentium Malorum (1951)
- Orientales Ecclesias (1952)
- Doctor Mellifluus (1953)
- Fulgens Corona (1953)
- Sacra Virginitas (1954)
- Ecclesiae Fastos (1954)
- Ad Caeli Reginam (1954)
- Musicae Sacrae (1955)
- Haurietis Aquas (1956)
- Fidei Donum (1957)
- Le Pèlerinage de Lourdes (1957)
- Miranda Prorsus (1957)
- Ad Apostolorum Principis (1958)
- Meminisse Iuvat (1958)

### Vol. II — O Concílio e a Modernidade

**João XXIII (8)**
- Ad Petri Cathedram (1959)
- Sacerdotii Nostri Primordia (1959)
- Grata Recordatio (1959)
- Princeps Pastorum (1959)
- Mater et Magistra (1961)
- Aeterna Dei Sapientia (1961)
- Paenitentiam Agere (1962)
- Pacem in Terris (1963)

**Paulo VI (7)**
- Ecclesiam Suam (1964)
- Mense Maio (1965)
- Mysterium Fidei (1965)
- Christi Matri (1966)
- Populorum Progressio (1967)
- Sacerdotalis Caelibatus (1967)
- Humanae Vitae (1968)

### Vol. III — João Paulo II — I (1979–1991)

- Redemptor Hominis (1979)
- Dives in Misericordia (1980)
- Laborem Exercens (1981)
- Slavorum Apostoli (1985)
- Dominum et Vivificantem (1986)
- Redemptoris Mater (1987)
- Sollicitudo Rei Socialis (1987)
- Redemptoris Missio (1990)
- Centesimus Annus (1991)

### Vol. IV — João Paulo II — II (1993–2003)

- Veritatis Splendor (1993)
- Evangelium Vitae (1995)
- Ut Unum Sint (1995)
- Fides et Ratio (1998)
- Ecclesia de Eucharistia (2003)

### Vol. V — A Igreja no Século XXI

**Bento XVI (3)**
- Deus caritas est (2005)
- Spe salvi (2007)
- Caritas in veritate (2009)

**Francisco (4)**
- Lumen fidei (2013)
- Laudato Si (2015)
- Fratelli tutti (2020)
- Dilexit nos (2024)

---

## Documentos sem versão PT no Vaticano (excluídos)

58 documentos aparecem no índice PT do Vaticano mas sem texto digitalizado.
Podem ser adicionados futuramente se o Vaticano disponibilizar o texto.

---

## Como gerar os PDFs

```bash
# Todos os volumes
DYLD_LIBRARY_PATH=/opt/homebrew/lib uv run book-volumes-generator

# Um volume específico
DYLD_LIBRARY_PATH=/opt/homebrew/lib uv run book-volumes-generator --volume vol-ii
```

Saída: `api/books/vol-{i}.pdf`