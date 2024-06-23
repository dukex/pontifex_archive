import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_bloc.dart';
import 'package:pontifex_archive/src/features/author/application/blocs/author_state.dart';

class AuthorScreen extends StatelessWidget {
  final AuthorState state;

  const AuthorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthorBloc>().state as AuthorLoadedState;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          primary: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildChildren(context, state)),
          ));
    });
  }

  List<Widget> _buildChildren(BuildContext context, AuthorLoadedState state) {
    final author = state.author;

    const padding = 12.0;
    final width = (MediaQuery.of(context).size.width);

    var children = <Widget>[
      SafeArea(
          child: SaferContainer(
              child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 1,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                author.imageUrl,
                fit: BoxFit.fitWidth,
                width: (width / 12) * 4,
                height: (width / 12) * 4,
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: padding / 2, right: padding),
            margin: const EdgeInsets.all(padding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.t.author.header.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    author
                        .nameLocale(LocaleSettings.currentLocale.flutterLocale),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ]),
          ))
        ],
      ))),
    ];

    // author.documentsGroupedByType.keys.forEach((key) {
    //   children.addAll([
    //     SaferContainer(
    //       child: Text(
    //           context.t.$meta.getTranslation("author.documents.type.$key"),
    //           style: Theme.of(context).textTheme.titleLarge?.copyWith()),
    //     ),
    //     SaferContainer(
    //         child: GridView.builder(
    //             padding: EdgeInsets.zero,
    //             physics: const NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 3,
    //               mainAxisSpacing: 6,
    //               crossAxisSpacing: 6,
    //               childAspectRatio: 2 / 2.70,
    //             ),
    //             itemCount: author.documentsGroupedByType[key]?.length,
    //             itemBuilder: (context, index) {
    //               return DocumentListItem(
    //                   document: author.documentsGroupedByType[key]![index]);
    //             }))
    //   ]);
    // });

    return children;
  }
}

class SaferContainer extends StatelessWidget {
  final Widget child;

  const SaferContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const padding = 12.0;

    return Padding(
        padding: const EdgeInsets.only(
            top: padding, left: padding, right: padding, bottom: 0),
        child: child);
  }
}
