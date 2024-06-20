import 'package:pontifex_archive/src/core/domain/entities/pope.dart';

abstract class HomeState {
  final bool loading;
  final bool completed;
  final List<PopeEntity> popes;

  HomeState(this.loading, this.completed, this.popes);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(true, false, []);
}

class PopesLoadedState extends HomeState {
  PopesLoadedState(popes) : super(false, true, popes);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message) : super(false, true, []);
}
