import 'dart:convert';

class DateTimeToStringConverter with Converter<DateTime, String> {
  const DateTimeToStringConverter();

  @override
  String convert(DateTime input) {
    return input.toIso8601String();
  }
}
