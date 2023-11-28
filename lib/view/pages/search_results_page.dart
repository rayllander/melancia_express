import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';

class SearchResultsPage extends StatelessWidget {
  final List<String> searchResults;

  SearchResultsPage({Key? key, required this.searchResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'RESULTADOS DA PESQUISA'),
      body: _buildBody(),
      bottomNavigationBar: MyBottomBar(),
    );
  }

  Widget _buildBody() {
    return searchResults.isNotEmpty
        ? ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]),
              );
            },
          )
        : Container();
  }
}
