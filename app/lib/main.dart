import 'package:flutter/material.dart';
import 'package:pontifex_archive/data/models.dart';
import 'package:pontifex_archive/screens/documents.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DocumentsScreen(documents: fetchDocuments()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Document>> fetchDocuments() async {
    final response = await http.get(Uri.parse(
        'https://emersonalmeida.wtf/pontifex_archive/documents.json'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Document> documents =
          body.map((dynamic item) => Document.fromJson(item)).toList();
      return documents;
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
