import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/features/home/domain/usecases/get_popes.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopes getPopes;

  HomeBloc(this.getPopes) : super(HomeInitialState()) {
    on<LoadHomeEvent>(_onLoadDocuments);
  }

  Future<void> _onLoadDocuments(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final popes = await getPopes();
      emit(PopesLoadedState(popes));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
