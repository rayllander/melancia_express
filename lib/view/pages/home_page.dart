import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/controllers/anuncio_controller.dart';
import 'package:melancia_express/view/components/my_anuncio_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final UserController userController = UserController();
  final TextEditingController searchController = TextEditingController();
  final AnuncioController anuncioController = AnuncioController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = '';

  void goToSearchResults(BuildContext context) {
    final searchTerm = widget.searchController.text.toLowerCase().trim();

    if (searchTerm.isNotEmpty) {
      // Se houver lógica específica de navegação para a tela de resultados de pesquisa, adicione aqui
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
          centerTitle: true, // Centralize o título (a barra de pesquisa)
          automaticallyImplyLeading: false, // Remove a seta de voltar na AppBar
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
                      anuncio: widget.anuncioController.listaDeAnuncios[index]);
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
