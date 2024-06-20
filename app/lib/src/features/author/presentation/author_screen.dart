import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_bloc.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/toggle_language.dart';

class AuthorScreen extends StatelessWidget {
  final AuthorState state;

  const AuthorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthorBloc>().state as AuthorLoadedState;
    final author = state.author;

    const padding = 5.0;
    final width = (MediaQuery.of(context).size.width);

    final List<Widget> children = <Widget>[
      SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    author.imageUrl,
                    width: (width / 12) * 5.5,
                    height: (width / 12) * 5.5,
                    fit: BoxFit.fitWidth,
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.all(padding),
                    child: Column(children: [
                      Text(
                        context.t.author.header.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        author.nameLocale(
                            LocaleSettings.currentLocale.flutterLocale),
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                    ]),
                  ))
                ],
              ))),
      const ToggleLanguage(),
      state.loading
          ? Container(
              padding: const EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: const CircularProgressIndicator())
          : const SizedBox()
    ];

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ));
    });
  }
}
