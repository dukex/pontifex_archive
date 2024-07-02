import 'package:better_router/better_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:pontifex_archive/src/features/author/presentation/author_page.dart';
import 'package:pontifex_archive/src/features/home/presentation/home_page.dart';
import 'package:pontifex_archive/src/features/onboarding/presentation/onboarding_page.dart';
import 'package:pontifex_archive/src/features/reader/presentation/reader_page.dart';

final routes = <String, PageRoute<dynamic> Function(RouteSettings)>{
  "/onboarding": DefaultPageRouteBuilder((_) => const OnboardingPage()).call,
  "/": DefaultPageRouteBuilder((_) => const HomePage()).call,
  r"\/reader\/(?<id>.+)": DefaultPageRouteBuilder((context) {
    final params = RouteParams.of(context);

    return ReaderPage(id: params["id"]!);
  }).call,
  r"\/author\/(?<id>.+)": DefaultPageRouteBuilder((context) {
    final params = RouteParams.of(context);

    return AuthorPage(id: params["id"]!);
  }).call,
  '-matchAll':
      DefaultPageRouteBuilder((_) => const Text('not found page')).call,
};
