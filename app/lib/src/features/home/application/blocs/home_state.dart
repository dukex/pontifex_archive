import 'package:pontifex_archive/src/core/domain/entities/pope.dart';

abstract class HomeState {
  final bool loading;
  final List<PopeEntity> popes;

  HomeState(this.loading, this.popes);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(true, []);
}

class PopesLoadedState extends HomeState {
  PopesLoadedState(popes) : super(false, popes);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message) : super(false, []);
}
