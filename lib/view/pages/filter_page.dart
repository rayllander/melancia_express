import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/filter_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/pages/Filtered_Announcements_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<String?> getUserId() async {
  var currentUser = await ParseUser.currentUser() as ParseUser?;
  return currentUser?.objectId;
}

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedCategory = '';
  String selectedStatus = '';

  FilterController filterController = FilterController();
  bool hasSavedFilter = false;
  Map<String, String>? savedFilter;

  @override
  void initState() {
    super.initState();
    loadSavedFilter();
  }

  Future<void> loadSavedFilter() async {
    // Obtém o ID do usuário logado
    String? userId = await getUserId();

    // ignore: unnecessary_null_comparison
    if (userId != null) {
      // Obtém o filtro salvo do banco de dados
      savedFilter = await filterController.getSavedFilter(userId);

      if (savedFilter != null) {
        setState(() {
          selectedCategory = savedFilter!['categoria'] ?? '';
          selectedStatus = savedFilter!['status'] ?? '';
          hasSavedFilter = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'FILTRAR POR'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 197, 196, 196),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 231, 230, 230),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      'CATEGORIAS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_drop_down),
                    onTap: () {
                      _showOptionsDialog(
                        'CATEGORIAS',
                        [
                          'Sem semente',
                          'Polpa Amarela',
                          'Polpa Vermelha',
                          'Polpa Branca'
                        ],
                        selectedCategory,
                        (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 197, 196, 196),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 231, 230, 230),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      'STATUS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_drop_down),
                    onTap: () {
                      _showOptionsDialog(
                        'STATUS',
                        [
                          'Plantio',
                          'Crescimento',
                          'Colheira 1ª Panha',
                          'Colheita 2ª Panha',
                          'Colheita 3ª Panha'
                        ],
                        selectedStatus,
                        (value) {
                          setState(() {
                            selectedStatus = value;
                          });
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Exibe os dados do anúncio salvo, se houver
                if (hasSavedFilter)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filtro Salvo:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (savedFilter != null &&
                            savedFilter!['categoria'] != null)
                          Text('Categoria: ${savedFilter!['categoria']}'),
                        if (savedFilter != null &&
                            savedFilter!['status'] != null)
                          Text('Status: ${savedFilter!['status']}'),
                      ],
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                  child: MyButton(
                    onTapButton: () async {
                      if (selectedCategory.isEmpty || selectedStatus.isEmpty) {
                        _showEmptyFieldsDialog();
                      } else {
                        // Obtém o ID do usuário logado
                        String? userId = await getUserId();

                        // ignore: unnecessary_null_comparison
                        if (userId != null) {
                          // Salva o filtro no banco de dados
                          bool saved = await filterController.saveFilter(
                            userId: userId,
                            categoria: selectedCategory,
                            status: selectedStatus,
                          );

                          if (saved) {
                            setState(() {
                              hasSavedFilter = true;
                            });
                            _showSavedFilterDialog();
                            print('Filtro salvo com sucesso!');
                          } else {
                            print('Erro ao salvar o filtro.');
                          }
                        } else {
                          print('Erro ao obter o ID do usuário.');
                        }
                      }
                    },
                    buttonText: 'SALVAR',
                  ),
                ),
                // Exibe o botão "BUSCAR" apenas se houver um filtro salvo
                if (hasSavedFilter)
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                    child: MyButton(
                      onTapButton: () {
                        // Navegar para a tela FilteredAnnouncementsPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilteredAnnouncementsPage(),
                          ),
                        );
                      },
                      buttonText: 'BUSCAR',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }

  Future<void> _showOptionsDialog(String title, List<String> options,
      String selectedOption, Function(String) onChanged) async {
    String? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            children: options.map((option) {
              return ListTile(
                title: Text(option),
                leading: Radio(
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    onChanged(value.toString());
                    Navigator.of(context).pop(value);
                  },
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      onChanged(result);
    }
  }

  Future<void> _showSavedFilterDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filtro Salvo'),
          content: Text('Seu filtro foi salvo com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Atualizar a página para refletir o filtro salvo
                loadSavedFilter();
              },
              child: Text('OK'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEmptyFieldsDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Campos Vazios'),
          content: Text('Por favor, selecione os campos do filtro.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String categoria;
  final String status;

  HomeScreen({required this.categoria, required this.status});

  @override
  Widget build(BuildContext context) {
    // Implemente a lógica para exibir os anúncios filtrados na tela home
    return Scaffold(
      appBar: MyAppBar(title: 'ANÚNCIOS FILTRADOS'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Anúncios filtrados aqui'),
            Text('Categoria: $categoria'),
            Text('Status: $status'),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
