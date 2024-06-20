class PopeTranslation {
  final String languageCode;
  final String name;
  final String motto;

  PopeTranslation({
    required this.languageCode,
    required this.name,
    required this.motto,
  });

  factory PopeTranslation.fromJson(Map<String, dynamic> json) {
    return PopeTranslation(
        languageCode: json['language_code'],
        name: json['name'],
        motto: json['motto']);
  }
}

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
