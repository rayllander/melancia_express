import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/controllers/anuncio_controller.dart';
import 'package:melancia_express/view/components/my_anuncio_item.dart';
import 'package:melancia_express/view/pages/search_results_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final UserController userController = UserController();
  final TextEditingController searchController = TextEditingController();
  final AnuncioController anuncioController = AnuncioController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goToSearchResults(BuildContext context) async {
    final searchTerm = widget.searchController.text.toLowerCase().trim();

    if (searchTerm.isNotEmpty) {
      // Pesquisar usuários no banco por nome
      final results = await widget.userController.searchUsersByName(searchTerm);

      if (results.isEmpty) {
        // Exibe um aviso se nenhum usuário for encontrado
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Usuário não encontrado'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Fundo branco
                      border: Border.all(color: Colors.red), // Borda vermelha
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.red, // Cor do texto vermelho
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        // Navega para a página de resultados
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsPage(
              searchResults: results,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Impede que o usuário volte à tela anterior
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEA3026),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
              color: Color(0x77D9D9D9),
              border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.searchController,
                    onChanged: (value) {
                      // Chama a função de pesquisa após cada alteração no texto
                      // Removendo a lógica de pesquisa automática
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar por usuários',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Chama a função de pesquisa imediatamente quando o botão é pressionado
                    goToSearchResults(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnuncioItem(
                    anuncio: widget.anuncioController.listaDeAnuncios[index],
                  );
                },
                childCount: widget.anuncioController.listaDeAnuncios.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: MyBottomBar(),
      ),
    );
  }
}
