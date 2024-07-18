class DocumentTranslation {
  final String id;
  final String languageCode;
  final String vaticanUrl;
  final String epubUrl;
  String? offlinePath; // Caminho do arquivo do texto offline

  DocumentTranslation({
    required this.id,
    required this.languageCode,
    required this.vaticanUrl,
    required this.epubUrl,
    this.offlinePath,
  });

  factory DocumentTranslation.fromJson(Map<String, dynamic> json) {
    return DocumentTranslation(
      id: json['id'],
      epubUrl: json['epub_url'],
      languageCode: json['language_code'],
      vaticanUrl: json['vatican_url'],
    );
  }
}
