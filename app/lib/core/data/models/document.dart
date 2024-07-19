import 'package:cv/cv.dart';
import 'package:pontifex_archive/core/codecs/date_time_to_string_codec.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';

class Document extends CvModelBase {
  final id = CvField<String>('id');
  final authorId = CvField<String>('authorId');
  final type = CvField<String>('type');
  final name = CvField<String>('name');
  final date =
      CvField.encoded<DateTime, String>('date', codec: DateTimeToStringCodec());
  final coverUrl = CvField<String>('cover_url');
  final translations = CvModelListField<DocumentTranslation>('translations');

  @override
  CvFields get fields =>
      [id, authorId, type, name, date, coverUrl, translations];
}
