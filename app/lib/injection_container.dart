import 'package:get_it/get_it.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_popes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => HomeBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPopes(sl(), sl()));

  // Repository
  sl.registerLazySingleton<PopeRepository>(
    () => PopeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(sl()));

  // Provider
  sl.registerFactory(
    () => PopeProvider(),
  );
  sl.registerFactory(() => PreferencesProvider());
}
