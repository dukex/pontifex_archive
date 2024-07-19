import 'dart:convert';

class StringToDateTimeConverter with Converter<String, DateTime> {
  const StringToDateTimeConverter();

  @override
  DateTime convert(String input) {
    return DateTime.parse(input);
  }
}
