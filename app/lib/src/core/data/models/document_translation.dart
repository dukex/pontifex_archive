class DocumentTranslation {
  final String languageCode;
  final String vaticanUrl; // vaticanUrl do texto online
  String? offlinePath; // Caminho do arquivo do texto offline

  DocumentTranslation({
    required this.languageCode,
    required this.vaticanUrl,
    this.offlinePath,
  });

  factory DocumentTranslation.fromJson(Map<String, dynamic> json) {
    return DocumentTranslation(
      languageCode: json['language_code'],
      vaticanUrl: json['vatican_url'],
    );
  }
}
