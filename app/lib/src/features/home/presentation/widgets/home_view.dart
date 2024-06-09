import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list_item.dart';

class HomeView extends StatelessWidget {
  final DocumentsLoadedState state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 3),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage('assets/images/vatican.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Continue sua leitura',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _buildContinueReadingCard(context),
                const SizedBox(height: 16),
                // Carrossel dos Papas
                Text(
                  'Papas',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _buildPopeCarousel(context),
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.documents.length,
            itemBuilder: (context, index) {
              return DocumentListItem(document: state.documents[index]);
            },
          )
        ],
      ),
    );
  }

  Widget _buildContinueReadingCard(BuildContext context) {
    // Substitua pelos dados reais do último documento aberto
    Map<String, String> lastDocument = {
      'title': 'Caritas in Veritate',
      'pope': 'Benedictus XVI',
    };

    return Card(
      child: ListTile(
        title: Text(lastDocument['title']!),
        subtitle: Text('Pope: ${lastDocument['pope']}'),
        trailing: CircularProgressIndicator(
          value: 0.5,
          backgroundColor: Colors.grey[200],
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         ReaderPage(id: 'enc-20090629-caritas_in_veritate'),
          //   ),
          // );
        },
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
