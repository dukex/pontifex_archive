import 'package:flutter/material.dart';
import 'package:pontifex_archive/data/models.dart';

class DocumentsScreen extends StatelessWidget {
  Future<List<Document>> documents;

  DocumentsScreen({Key? key, required this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: FutureBuilder<List<Document>>(
        future: documents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No documents found'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((doc) => ListTile(
                        title: Text(doc.name),
                        subtitle: Text('Pope: ${doc.pope.name}'),
                        onTap: () {
                          // Handle tap
                        },
                      ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
