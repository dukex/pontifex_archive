import 'dart:convert';
import 'package:pontifex_archive/core/codecs/converters/date_time_to_string_converter.dart';
import 'package:pontifex_archive/core/codecs/converters/string_to_date_time_converter.dart';

class DateTimeToStringCodec with Codec<DateTime, String> {
  @override
  Converter<String, DateTime> get decoder => const StringToDateTimeConverter();

  @override
  Converter<DateTime, String> get encoder => const DateTimeToStringConverter();
}
