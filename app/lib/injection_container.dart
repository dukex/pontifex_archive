import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/leigo_fm_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_popes.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_bloc.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/get_document.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/save_reading_position.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/src/features/search/data/providers/search_provider.dart';
import 'package:pontifex_archive/src/features/search/data/providers/search_sqlite_provider.dart';
import 'package:pontifex_archive/src/features/search/data/repositories/search_repository.dart';
import 'package:pontifex_archive/src/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/src/features/search/domain/usecases/search.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => HomeBloc(sl()),
  );
  sl.registerFactory(() => ReaderBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SearchBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPopes(sl(), sl()));
  sl.registerLazySingleton(() => GetDocument(sl(), sl()));
  sl.registerLazySingleton(() => DownloadEbook(sl(), sl()));
  sl.registerLazySingleton(() => SaveReadingPosition(sl()));
  sl.registerLazySingleton(() => Search(sl()));

  // Repository
  sl.registerLazySingleton<PopeRepository>(
    () => PopeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(sl()));
  sl.registerLazySingleton<DocumentRepository>(
      () => DocumentRepositoryImpl(sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));

  // Provider
  sl.registerFactory(() => LeigoFmProvider(http.Client()));
  sl.registerFactory(
    () => PopeProvider(sl()),
  );
  sl.registerFactory(() => PreferencesProvider());
  sl.registerFactory(() => DocumentProvider(sl()));
  sl.registerLazySingleton<SearchProvider>(() => SearchSQLiteProvider());
}
