import 'package:cv/cv.dart';

class AuthorTranslation extends CvModelBase {
  final languageCode = CvField<String>('language_code');
  final name = CvField<String>('name');

  @override
  CvFields get fields => [languageCode, name];
}
