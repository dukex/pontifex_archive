import 'package:better_router/better_router.dart';
import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/presentation/home_page.dart';
import 'package:pontifex_archive/src/features/onboarding/presentation/onboarding_page.dart';
import 'package:pontifex_archive/src/features/reader/presentation/reader_page.dart';

final books = [
  const Book(id: '3160', name: 'The Odyssey', author: 'Homer'),
  const Book(id: '8795', name: 'The Divine Comedy', author: 'Dante Alighieri'),
];

class Book {
  final String id;
  final String name;
  final String author;

  const Book({required this.id, required this.name, required this.author});
}

final routes = <String, PageRoute<dynamic> Function(RouteSettings)>{
  "/": DefaultPageRouteBuilder((_) => OnboardingPage()).call,
  "/home": DefaultPageRouteBuilder((_) => HomePage()).call,
  r"\/reader\/(?<id>.+)": DefaultPageRouteBuilder((context) {
    final params = RouteParams.of(context);

    return ReaderPage(id: params["id"]!);
  }).call,
  '-matchAll': DefaultPageRouteBuilder((_) => Text('not found page')),
};
