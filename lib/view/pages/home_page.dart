import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
//import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/controllers/Usuario_controller.dart';
import 'package:melancia_express/view/pages/search_results_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final UsuarioController _usuarioController =
      UsuarioController(); // Use UsuarioController
  final TextEditingController searchController = TextEditingController();
  List<String> filteredUsuarios = [];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goToSearchResults(BuildContext context) {
    final searchTerm = widget.searchController.text.toLowerCase();
    final searchResults = widget._usuarioController.usuarios.where((usuario) {
      final nomeUsuario = usuario.toLowerCase();
      return nomeUsuario.startsWith(searchTerm);
    }).toList();

    if (searchResults.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(searchResults: searchResults),
        ),
      );
    } else {
      // Se não houver resultados, navegue para a página de resultados em branco
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(searchResults: []),
        ),
      );
    }
  }

//
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Color(0xFFEA3026), // Cor do cabeçalho
            child: Column(
              // Usando uma coluna para centralizar verticalmente
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza verticalmente
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 50.0), // Ajuste o valor conforme necessário
                  child: Container(
                    width: 353,
                    height: 43,
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
                              hintText: 'Pesquisar por usúarios',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left:
                                      20.0), // Adiciona espaço à esquerda do texto digitado
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Chamando a função goToSearchResults quando o botão de pesquisa for pressionado
                            goToSearchResults(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Conteúdo da página
                  // Exemplo de anúncio
                  ListTile(
                    title: Text('Anúncio 1'),
                    subtitle: Text('Descrição do anúncio 1'),
                  ),
                  ListTile(
                    title: Text('Anúncio 2'),
                    subtitle: Text('Descrição do anúncio 2'),
                  ),
                  ListTile(
                    title: Text('Anúncio 3'),
                    subtitle: Text('Descrição do anúncio 3'),
                  ),
                  ListTile(
                    title: Text('Anúncio 4'),
                    subtitle: Text('Descrição do anúncio 4'),
                  ),
                  ListTile(
                    title: Text('Anúncio 5'),
                    subtitle: Text('Descrição do anúncio 5'),
                  ),
                  ListTile(
                    title: Text('Anúncio 6'),
                    subtitle: Text('Descrição do anúncio 6'),
                  ),
                  ListTile(
                    title: Text('Anúncio 7'),
                    subtitle: Text('Descrição do anúncio 7'),
                  ),
                  ListTile(
                    title: Text('Anúncio 8'),
                    subtitle: Text('Descrição do anúncio 8'),
                  ),
                  ListTile(
                    title: Text('Anúncio 9'),
                    subtitle: Text('Descrição do anúncio 9'),
                  ),
                  ListTile(
                    title: Text('Anúncio 10'),
                    subtitle: Text('Descrição do anúncio 10'),
                  ),
                  ListTile(
                    title: Text('Anúncio 11'),
                    subtitle: Text('Descrição do anúncio 11'),
                  ),
                  ListTile(
                    title: Text('Anúncio 12'),
                    subtitle: Text('Descrição do anúncio 12'),
                  ),

                  // Mais anúncios...
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomBar(), // Usando o widget MyBottomBar
    );
  }
}
