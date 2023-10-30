import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key? key, required this.searchResults}) : super(key: key);

  final List<String> searchResults;

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    // Implemente a interface da página de resultados de pesquisa aqui
    return Scaffold(
      appBar: MyAppBar(
        title: 'Resultados da Pesquisa', // Passe a string diretamente
      ),
      body: ListView.builder(
        itemCount: widget.searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.searchResults[index]),
          );
        },
      ),
    );
  }
}
