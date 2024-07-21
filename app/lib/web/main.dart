import 'package:cv/cv.dart';
import 'package:flutter/material.dart';
import 'package:pontifex_archive/app.dart';
import 'package:pontifex_archive/core/data/models/author_translation.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';
import 'package:pontifex_archive/i18n.g.dart';
import '../injection_container/web.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  cvAddConstructor(AuthorTranslation.new);
  cvAddConstructor(Document.new);
  cvAddConstructor(DocumentTranslation.new);

  runApp(TranslationProvider(child: const App()));
}
