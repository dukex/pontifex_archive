import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/src/core/application/by_desc.dart';

void main() {
  group('byDesc tests', () {
    test('Sort dates in descending order', () {
      final dates = [
        DateTime.parse('2023-07-14'),
        DateTime.parse('2021-05-18'),
        DateTime.parse('2022-11-03'),
      ];

      dates.sort(byDesc<DateTime>((date) => date));

      expect(dates, [
        DateTime.parse('2023-07-14'),
        DateTime.parse('2022-11-03'),
        DateTime.parse('2021-05-18'),
      ]);
    });

    test('Sort integers in descending order', () {
      final integers = [3, 1, 4, 1, 5, 9, 2, 6, 5];

      integers.sort(byDesc<int>((n) => n));

      expect(integers, [9, 6, 5, 5, 4, 3, 2, 1, 1]);
    });

    test('Sort strings in descending order', () {
      final strings = ['banana', 'apple', 'cherry'];

      strings.sort(byDesc<String>((str) => str));

      expect(strings, ['cherry', 'banana', 'apple']);
    });
  });
}
