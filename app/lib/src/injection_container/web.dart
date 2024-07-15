import "package:pontifex_archive/src/features/search/data/providers/search_provider.dart";
import "package:pontifex_archive/src/features/search/data/providers/search_web_provider.dart";
import "package:pontifex_archive/src/injection_container/common.dart" as common;

import "sl.dart";

Future<void> init() async {
  common.init();

  sl.registerLazySingleton<SearchProvider>(() => SearchWebProvider());
}
