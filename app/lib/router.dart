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

class AppScalfold extends StatelessWidget {
  final Widget child;
  const AppScalfold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const selectedTab = 0;

    return AdaptiveScaffold(
      smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
      useDrawer: true,
      selectedIndex: selectedTab,
      onSelectedIndexChange: (int index) {
        // setState(() {
        //   _selectedTab = index;
        // });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox),
          label: 'Inbox',
        ),
        NavigationDestination(
          icon: Icon(Icons.article_outlined),
          selectedIcon: Icon(Icons.article),
          label: 'Articles',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_outlined),
          selectedIcon: Icon(Icons.chat),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: Icon(Icons.video_call_outlined),
          selectedIcon: Icon(Icons.video_call),
          label: 'Video',
        ),
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Inbox',
        ),
      ],
      body: (_) => child,
      smallBody: (_) => child,
      secondaryBody: (_) => Container(
        color: const Color.fromARGB(255, 234, 158, 192),
      ),
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}
