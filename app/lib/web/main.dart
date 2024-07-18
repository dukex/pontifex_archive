import 'package:flutter/material.dart';
import 'package:pontifex_archive/app.dart';
import 'package:pontifex_archive/i18n.g.dart';
import '../injection_container/web.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(TranslationProvider(child: const App()));
}
