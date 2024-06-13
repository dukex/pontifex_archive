class Pope {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime? startDate; // remove the ?
  final DateTime? endDate;
  final List<PopeTranslation> translations;

  factory Pope.fromJson(Map<String, dynamic> json) {
    return Pope(
        id: json['id'],
        name: json['name'],
        motto: "",
        country: "",
        translations: []);
  }

  Pope({
    required this.id,
    required this.name,
    required this.motto,
    required this.country,
    required this.translations,
    this.startDate,
    this.endDate,
  });
}

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

class Document {
  final Pope pope;
  final String id;
  final String type;
  final String name;
  final String date;
  final List<DocumentTranslation> translations;

  Document({
    required this.pope,
    required this.id,
    required this.type,
    required this.name,
    required this.date,
    required this.translations,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    var translationsFromJson = json['translations'] as List;
    List<DocumentTranslation> translationList = translationsFromJson
        .map((i) => DocumentTranslation.fromJson(i))
        .toList();

    return Document(
      id: json['id'],
      pope: Pope.fromJson(json['pope']),
      date: json['date'],
      type: json['type'],
      name: json['name'],
      translations: translationList,
    );
  }
}

class DocumentTranslation {
  final String language;
  final String name; // Nome do documento na lingua
  final String url; // URL do texto online
  String? offlinePath; // Caminho do arquivo do texto offline

  DocumentTranslation({
    required this.language,
    required this.name,
    required this.url,
    this.offlinePath,
  });

  factory DocumentTranslation.fromJson(Map<String, dynamic> json) {
    return DocumentTranslation(
      language: json['language'],
      name: json['name'],
      url: json['url'],
    );
  }
}
