class PopeTranslation {
  final String language;
  final String name;
  final String motto;

  PopeTranslation({
    required this.language,
    required this.name,
    required this.motto,
  });
}

class DocumentTranslation {
  final String language;
  final String vaticanUrl; // vaticanUrl do texto online
  String? offlinePath; // Caminho do arquivo do texto offline

  DocumentTranslation({
    required this.language,
    required this.vaticanUrl,
    this.offlinePath,
  });

  factory DocumentTranslation.fromJson(Map<String, dynamic> json) {
    return DocumentTranslation(
      language: json['language'],
      vaticanUrl: json['vatican_url'],
    );
  }
}
