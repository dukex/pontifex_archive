import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/header.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/popes_list_with_documents.dart';

class HomeView extends StatelessWidget {
  final HomeState state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: SafeArea(
                minimum: const EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildChildren(context)),
              )));
    });
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
      const Header(),
      PopesListWithDocuments(
        state: state,
      )
    ];
  }
}
