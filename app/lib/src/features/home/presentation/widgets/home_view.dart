import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/theme/media_utils.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/continue_reading_section.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/header.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/popes_list_with_documents.dart';

class HomeView extends StatelessWidget {
  final HomeState state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildChildren(context));
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
      const Header(),
      const SizedBox(height: 25),
      ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaUtils.of(context).mainMaxWidth),
          child: ContinueReadingSection(
            state: state,
          )),
      ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaUtils.of(context).mainMaxWidth),
          child: PopesListWithDocuments(
            state: state,
          ))
    ];
  }
}
