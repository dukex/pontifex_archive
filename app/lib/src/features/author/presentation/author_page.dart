import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/injection_container.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_bloc.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_event.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_state.dart';
import 'package:pontifex_archive/src/features/author/presentation/author_screen.dart';

class AuthorPage extends StatelessWidget {
  final String id;
  const AuthorPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthorBloc>(
      create: (_) => sl<AuthorBloc>()..add(LoadAuthorEvent(id: id)),
      child: Scaffold(
          body: BlocConsumer<AuthorBloc, AuthorState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AuthorErrorState) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is AuthorLoadedState) {
                  return AuthorScreen(state: state);
                } else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}
