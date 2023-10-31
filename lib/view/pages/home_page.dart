import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/Usuario_controller.dart';
import 'package:melancia_express/controllers/anuncio_controller.dart';
import 'search_results_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final UsuarioController _usuarioController = UsuarioController();
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
      final searchResults = widget._usuarioController.usuarios.where((usuario) {
        final nomeUsuario = usuario.toLowerCase();
        return nomeUsuario.startsWith(searchTerm);
      }).toList();

      if (searchResults.isNotEmpty) {
        message = "Resultados da pesquisa para '$searchTerm'";
      } else {
        message = "Nenhum resultado encontrado para '$searchTerm'";
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(
            searchResults: searchResults,
            message: message,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEA3026),
        centerTitle: true, // Centralize o título (a barra de pesquisa)
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: Container(
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
                return Container(
                  width: 377,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF000000).withOpacity(0.2),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        widget
                            .anuncioController.listaDeAnuncios[index].imagemUrl,
                        width: 377,
                        height: 266,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      //
                      //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Categoria: ${widget.anuncioController.listaDeAnuncios[index].categoria}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //
                      //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Status: ${widget.anuncioController.listaDeAnuncios[index].status}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //
                      //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Data de Colheita: ${widget.anuncioController.listaDeAnuncios[index].dataColheita}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //
                      //

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Comentários: ${widget.anuncioController.listaDeAnuncios[index].comentarios.join(', ')}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //
                      //
                      Align(
                        alignment: Alignment.centerRight, // Alinhe à direita
                        child: Text(
                          " Preço: ${widget.anuncioController.listaDeAnuncios[index].preco.toStringAsFixed(2)}  ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      //
                      //
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Container(
                        width: 377,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF000000).withOpacity(0.2),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Telefone:",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${widget.anuncioController.listaDeAnuncios[index].telefone}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 377,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF000000).withOpacity(0.2),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "E-mail:",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${widget.anuncioController.listaDeAnuncios[index].email}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: widget.anuncioController.listaDeAnuncios.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
