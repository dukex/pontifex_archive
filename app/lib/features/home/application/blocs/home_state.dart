import 'package:pontifex_archive/features/home/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/domain/entities/pope.dart';

abstract class HomeState {
  final bool loading;
  final List<PopeEntity> popes;
  final List<DocumentEntity> readingDocuments;

  HomeState(this.loading, this.popes, this.readingDocuments);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(true, [], []);
}

class PopesLoadedState extends HomeState {
  PopesLoadedState(
      List<PopeEntity> popes, List<DocumentEntity> readingDocuments)
      : super(false, popes, readingDocuments);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message) : super(false, [], []);
}
