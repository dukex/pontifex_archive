import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list_item.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/header.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_modal.dart';

class HomeScreen extends StatelessWidget {
  final DocumentsLoadedState state;

  const HomeScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final state = context.read<DocumentsBloc>().state;

    final List<Widget> children = <Widget>[
      const Header(),
      Text(
        'Continue reading',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: 8),
      _buildContinueReadingCard(context),
      const SizedBox(height: 16),
      // Carrossel dos Papas
      Text(
        'Popes',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: 8),
      _buildPopeCarousel(context),
      Text(
        'Documents',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: 2 / 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: state.documents.length,
          itemBuilder: (context, index) {
            return DocumentListItem(document: state.documents[index]);
          })
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ));
    });
  }

  Widget _buildContinueReadingCard(BuildContext context) {
    final document = DocumentEntity(
        id: "enc-20051225-deus_caritas_est",
        type: "enc",
        name: "Deus caritas est",
        date: DateTime.parse("2005-12-25"),
        translations: []);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          showDocumentModal(context, document);
        },
        child: ListTile(
          leading: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(document.coverUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            document.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(document.pope.name),
        ),
      ),
    );
  }

  Widget _buildPopeCarousel(BuildContext context) {
    final popes = [
      {'name': 'Franciscus', 'image': 'assets/images/francesco.png'},
      {'name': 'Benedictus XVI', 'image': 'assets/images/benedetto_XVI.png'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popes.length,
        itemBuilder: (context, index) {
          final pope = popes[index];
          return GestureDetector(
            onTap: () {
              // Exibir documentos do papa selecionado
            },
            child: Card(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 110,
                  child: Column(
                    children: [
                      Image.asset(
                        pope['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pope['name']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
