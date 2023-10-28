import 'package:flutter/material.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors
          .red, // Define a cor vermelha para o fundo do BottomNavigationBar
      selectedItemColor:
          Colors.white, // Define a cor branca para os ícones selecionados
      unselectedItemColor:
          Colors.white, // Define a cor branca para os ícones não selecionados
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // Ícone de perfil
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add), // Ícone de mais
          label: 'Anunciar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_list_outlined), // Ícone de filtrar
          label: 'Filtrar',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          goToProfile(context); // Navegar para a página de perfil
        } else if (index == 1) {
          goToAnnouncement(context); // Navegar para a página de filtro
        } else if (index == 2) {
          goToFilter(context); // Navegar para a página de anúncio
        }
      },
    );
  }
}
