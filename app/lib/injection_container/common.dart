import 'package:http/http.dart' as http;
import 'package:pontifex_archive/core/data/providers/local/preferences_local_provider_impl.dart';
import 'package:pontifex_archive/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/core/data/providers/remote/leigo_fm_provider.dart';
import 'package:pontifex_archive/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository_impl.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/features/home/domain/usecases/get_popes.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_bloc.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/get_document.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/save_reading_position.dart';
import 'package:pontifex_archive/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/features/search/domain/usecases/search.dart';

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => HomeBloc(sl()),
  );
  sl.registerFactory(() => ReaderBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SearchBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPopes(sl(), sl()));
  sl.registerLazySingleton(() => GetDocument(sl()));
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
  sl.registerLazySingleton<PreferencesProvider>(
      () => PreferencesLocalProviderImpl());
  sl.registerFactory(() => DocumentProvider(sl()));
}
