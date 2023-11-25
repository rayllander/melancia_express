import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/view/components/my_button.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> selectedCategories = [];
  List<String> selectedPrices = [];
  List<String> selectedStatus = [];

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
                FilterSection(
                  title: 'CATEGORIAS',
                  options: [
                    'Sem semente',
                    'Polpa Amarela',
                    'Polpa Vermelha',
                    'Polpa Branca'
                  ],
                  selectedOptions: selectedCategories,
                ),
                //   FilterSection(
                //    title: 'PREÇOS',
                //    options: [
                //      '0,00 a 2,30',
                //     '2,31 a 2,50',
                //     '2,51 a 2,80',
                //      '2,81 a 3,00'
                //    ],
                //    selectedOptions: selectedPrices,
                //  ),
                FilterSection(
                  title: 'STATUS',
                  options: [
                    'Plantio',
                    'Crescimento',
                    'Colheira 1ª Panha',
                    'Colheita 2ª Panha',
                    'Colheita 3ª Panha'
                  ],
                  selectedOptions: selectedStatus,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                  child: MyButton(
                    onTapButton: () {
                      // Realizar a ação desejada com as opções selecionadas
                      //print('Categorias selecionadas: $selectedCategories');
                      // print('Preços selecionados: $selectedPrices');
                      // print('Status selecionados: $selectedStatus');
                    },
                    buttonText: 'SALVAR',
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 100),
                  child: MyButton(
                    onTapButton: () {},
                    buttonText: 'Buscar',
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
}

class FilterSection extends StatefulWidget {
  final String title;
  final List<String> options;
  final List<String> selectedOptions;

  FilterSection({
    required this.title,
    required this.options,
    required this.selectedOptions,
  });

  @override
  _FilterSectionState createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
          decoration: BoxDecoration(
            border: Border.all(
                color:
                    Color.fromARGB(255, 197, 196, 196)), // Adiciona borda cinza
            borderRadius: BorderRadius.circular(5), // Borda arredondada
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 231, 230, 230), // Cor do botão
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ),
        if (isExpanded)
          Column(
            children: widget.options.map((option) {
              return ListTile(
                title: Text(option),
                leading: Checkbox(
                  value: widget.selectedOptions.contains(option),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          widget.selectedOptions.add(option);
                        } else {
                          widget.selectedOptions.remove(option);
                        }
                      }
                    });
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
