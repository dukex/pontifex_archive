import 'package:cv/cv.dart';
import 'package:pontifex_archive/core/data/models/author_translation.dart';
import 'package:pontifex_archive/core/data/models/document.dart';

class Author extends CvModelBase {
  final id = CvField<String>('id');
  final name = CvField<String>('name');
  final country = CvField<String>('country');
  final translations = CvModelListField<AuthorTranslation>('translations');
  final documents = CvModelListField<Document>('documents');
  final imageUrl = CvField<String>('image_url');

  @override
  CvFields get fields => [id, name, country, translations, documents, imageUrl];
}
