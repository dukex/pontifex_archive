class Pope {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime startDate;
  final DateTime? endDate;
  final List<PopeTranslation> translations;

  Pope({
    required this.id,
    required this.name,
    required this.motto,
    required this.startDate,
    required this.country,
    this.endDate,
    required this.translations,
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
  final String type;
  final String name; // Nome do documento em latim
  final DateTime date;
  final String url; // URL do texto online em latim
  final List<DocumentTranslation> translations;

  Document({
    required this.pope,
    required this.type,
    required this.name,
    required this.date,
    required this.url,
    required this.translations,
  });
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
}
