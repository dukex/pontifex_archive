import "package:pontifex_archive/features/search/data/providers/search_provider.dart";
import "package:pontifex_archive/features/search/data/providers/search_web_provider.dart";
import "package:pontifex_archive/injection_container/common.dart" as common;

import "sl.dart";

Future<void> init() async {
  common.init();

  sl.registerLazySingleton<SearchProvider>(() => SearchWebProvider());
}
