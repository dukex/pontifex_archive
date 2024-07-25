import 'package:cv/cv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pontifex_archive/app.dart';
import 'package:pontifex_archive/core/data/models/author_translation.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/injection_container/app.dart' as di;

import 'wait_for.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('opening the app and tap on book', (tester) async {
      di.init();

      cvAddConstructor(AuthorTranslation.new);
      cvAddConstructor(Document.new);
      cvAddConstructor(DocumentTranslation.new);

      await tester.pumpWidget(TranslationProvider(child: const App()));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));

      var bookFinder = find.textContaining("Deus caritas est").first;

      await waitFor(tester, bookFinder);

      await tester.tap(bookFinder);

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));

      expect(find.textContaining('DEUS CARITAS EST'), findsAtLeastNWidgets(1));
    });
  });
}
