import 'package:pontifex_archive/src/injection_container/sl.dart';
import 'package:pontifex_archive/src/features/search/data/providers/search_provider.dart';
import 'package:pontifex_archive/src/features/search/data/providers/search_sqlite_provider.dart';
import "package:pontifex_archive/src/injection_container/common.dart" as common;

Future<void> init() async {
  common.init();

  sl.registerLazySingleton<SearchProvider>(() => SearchSQLiteProvider(sl()));
}
