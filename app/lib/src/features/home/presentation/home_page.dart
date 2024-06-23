import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/pope_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_event.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_popes.dart';
import 'package:pontifex_archive/src/features/home/presentation/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final popeProvider = PopeProvider();
    final popeRepository = PopeRepositoryImpl(popeProvider);
    final getDocuments = GetPopes(popeRepository);

    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(getDocuments)..add(LoadHomeEvent()),
      child: Scaffold(
          body: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return HomeView(state: state);
                }
              })),
    );
  }
}
