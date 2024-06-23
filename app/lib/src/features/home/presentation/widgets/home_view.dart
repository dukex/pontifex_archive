import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/header.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/popes_list_with_documents.dart';

class HomeView extends StatelessWidget {
  final HomeState state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    //final state = context.read<HomeBloc>().state;

    // final List<Widget> children = <Widget>[
    //   state.loading
    //       ? Container(
    //           padding: const EdgeInsets.only(top: 5),
    //           alignment: Alignment.center,
    //           child: const CircularProgressIndicator())
    //       : const SizedBox(),
    //   Padding(
    //       padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    //       child: PopesListWithDocuments(
    //         state: state,
    //       ))
    // const ToggleLanguage(),

    // Text(
    //   'Continue reading',
    //   style: Theme.of(context).textTheme.titleMedium,
    // ),
    // const SizedBox(height: 8),
    // _buildContinueReadingCard(context),
    // const SizedBox(height: 16),
    // // Carrossel dos Papas
    // Text(
    //   'Popes',
    //   style: Theme.of(context).textTheme.titleMedium,
    // ),
    // const SizedBox(height: 8),
    // _buildPopeCarousel(context),
    // Text(
    //   'Documents',
    //   style: Theme.of(context).textTheme.titleMedium,
    // ),
    // GridView.builder(
    //     physics: const NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       // childAspectRatio: 2 / 3,
    //       mainAxisSpacing: 10.0,
    //       crossAxisSpacing: 10.0,
    //     ),
    //     itemCount: state.documents.length,
    //     itemBuilder: (context, index) {
    //       return DocumentListItem(document: state.documents[index]);
    //     })
    //];

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

  // Widget _buildContinueReadingCard(BuildContext context) {
  //   final document = DocumentEntity(
  //       id: "enc-20051225-deus_caritas_est",
  //       type: "enc",
  //       name: "Deus caritas est",
  //       date: DateTime.parse("2005-12-25"),
  //       translations: []);

  //   return Card(
  //     clipBehavior: Clip.hardEdge,
  //     child: InkWell(
  //       onTap: () {
  //         showDocumentModal(context, document);
  //       },
  //       child: ListTile(
  //         leading: Container(
  //           width: 75,
  //           height: 75,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: NetworkImage(document.coverUrl),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         title: Text(
  //           document.name,
  //           style: Theme.of(context).textTheme.titleLarge,
  //         ),
  //         subtitle: Text("Pope"),
  //       ),
  //     ),
  //   );
  // }
}
