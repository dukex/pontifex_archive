import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/core/theme/media_utils.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_bloc.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_event.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = MediaUtils.of(context);

    var padding = EdgeInsets.only(
        left: utils.padding, right: utils.padding, top: utils.padding);

    return BlocProvider<HomeBloc>(
      create: (_) => sl<HomeBloc>()..add(LoadHomeEvent()),
      child: Scaffold(
          body: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return SafeArea(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: padding,
                              child: HomeView(state: state))));
                }
              })),
    );
  }
}
