import 'package:cv/cv.dart';

class DocumentTranslation extends CvModelBase {
  final id = CvField<String>('id');
  final languageCode = CvField<String>('language_code');
  final vaticanUrl = CvField<String>('vatican_url');
  final epubUrl = CvField<String>('epub_url');

  @override
  CvFields get fields => [id, languageCode, vaticanUrl, epubUrl];
}
