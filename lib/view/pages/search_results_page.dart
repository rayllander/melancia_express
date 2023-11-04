import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key? key, required this.searchResults, this.message = ''})
      : super(key: key);

  final List<String> searchResults;
  final String message;

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'RESULTADOS DA PESQUISA',
      ),
      body: widget.searchResults.isNotEmpty
          ? ListView.builder(
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.searchResults[index]),
                );
              },
            )
          : Center(
              child: Text(widget.message),
            ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
