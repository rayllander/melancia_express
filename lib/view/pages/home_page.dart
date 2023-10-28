import 'package:flutter/material.dart';
//import 'package:melancia_express/view/components/my_button.dart';
//import 'package:melancia_express/view/components/my_textfield.dart';
//import 'package:melancia_express/view/helpers/interface_helpers.dart';
//import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Color(0xFFEA3026), // Cor do cabeçalho
            child: Center(
              child: Container(
                width: 353,
                height: 43,
                decoration: BoxDecoration(
                  color: Color(0x77D9D9D9),
                  border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search), // Ícone de busca (lupa)
                    SizedBox(
                        width: 8), // Espaçamento entre o ícone e o TextField
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          border: InputBorder.none,
                        ),
                        //controller: controllerPesquisa,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                  'Conteúdo da página'), // Conteúdo da página abaixo do cabeçalho
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomBar(), // Usando o widget MyBottomBar
    );
  }
}
