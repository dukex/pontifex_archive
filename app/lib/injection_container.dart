import 'package:get_it/get_it.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_bloc.dart';
import 'package:pontifex_archive/src/features/author/data/providers/author_provider.dart';
import 'package:pontifex_archive/src/features/author/data/repositories/author_repository.dart';
import 'package:pontifex_archive/src/features/author/data/repositories/author_repository_impl.dart';
import 'package:pontifex_archive/src/features/author/domain/usecases/get_author.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_popes.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_bloc.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/get_document.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/save_reading_position.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => HomeBloc(sl()),
  );
  sl.registerFactory(() => AuthorBloc(sl()));
  sl.registerFactory(() => ReaderBloc(sl(), sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPopes(sl()));
  sl.registerLazySingleton(() => GetAuthor(sl()));
  sl.registerLazySingleton(() => GetDocument(sl()));
  sl.registerLazySingleton(() => DownloadEbook(sl(), sl()));
  sl.registerLazySingleton(() => SaveReadingPosition(sl()));

  // Repository
  sl.registerLazySingleton<PopeRepository>(
    () => PopeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthorRepository>(() => AuthorRepositoryImpl(sl()));
  sl.registerLazySingleton<DocumentRepository>(
      () => DocumentRepositoryImpl(sl()));

  // Provider
  sl.registerFactory(
    () => PopeProvider(),
  );
  sl.registerFactory(() => PreferencesProvider());
  sl.registerFactory(() => AuthorProvider());
  sl.registerFactory(() => DocumentProvider());
}
