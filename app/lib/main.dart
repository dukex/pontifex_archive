import 'package:flutter/material.dart';
import 'package:pontifex_archive/app.dart';
import 'package:pontifex_archive/i18n.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TranslationProvider(child: const App()));
}
