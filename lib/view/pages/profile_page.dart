import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'USUÁRIO'),
      body: Padding(
        padding: EdgeInsets.only(
            top:
                50), // Adiciona espaço acima da Column (ajuste conforme necessário)
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 330, // Largura desejada para os botões
                child: MyButton(
                  buttonText: 'MEU PERFIL',
                  onTapButton: () {
                    goToMyPerfil(context);
                  },
                ),
              ),
              SizedBox(
                  height:
                      30), // Adiciona um espaço de 30 de altura entre os botões
              Container(
                width: 330, // Largura desejada para os botões
                child: MyButton(
                  buttonText: 'MEUS ANÚNCIOS',
                  onTapButton: () {
                    goToMyAnnouncement(context);
                  },
                ),
              ),
              SizedBox(
                  height:
                      30), // Adiciona um espaço de 30 de altura entre os botões e o ícone + texto
              GestureDetector(
                onTap: () {
                  goToInicio(context);
                  // Ação quando clicar no botão de sair
                  // Por exemplo: adicionar a lógica para sair do aplicativo
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 40), // Define a distância da borda esquerda
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Alinha os elementos à esquerda
                    children: [
                      Icon(Icons.exit_to_app,
                          color: Color(0xFFEA3026)), // Ícone de saída
                      SizedBox(width: 5), // Espaço entre o ícone e o texto
                      Text('SAIR',
                          style: TextStyle(
                              color: Color(0xFFEA3026))), // Texto 'SAIR'
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar: MyBottomBar(), // Usando o widget MyBottomBar
    );
  }
}
