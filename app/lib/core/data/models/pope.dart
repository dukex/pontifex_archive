import 'package:cv/cv.dart';
import 'package:pontifex_archive/core/codecs/date_time_to_string_codec.dart';
import 'package:pontifex_archive/core/data/models/author.dart';

class Pope extends Author {
  final motto = CvField<String>('motto');
  final startDate = CvField.encoded<DateTime, String>('start_date',
      codec: DateTimeToStringCodec());
  final endDate = CvField.encoded<DateTime, String>('end_date',
      codec: DateTimeToStringCodec());

  @override
  CvFields get fields => [
        id,
        name,
        country,
        translations,
        documents,
        imageUrl,
        motto,
        startDate,
        endDate
      ];
}
