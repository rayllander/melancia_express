import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_banner.dart';
import 'package:melancia_express/view/pages/edit_announcement_page.dart'; // Importe a página de edição

class MyAnnouncement extends StatelessWidget {
  MyAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'MEUS ANÚNCIOS'), // Usar o MyAppBar personalizado
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyBanner(
              imagePath: 'assets/images/logo.png', // Especifique o caminho da imagem
              onEdit: () {
                // Lógica de edição
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditAnnouncement()), // Navegar para a página de edição
                );
              },
              onDelete: () {
                // Lógica de exclusão
              },
            ),
            SizedBox(height: 25),

            MyBanner(
              imagePath: 'assets/images/logo.png', // Especifique o caminho da imagem
              onEdit: () {
                // Lógica de edição
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditAnnouncement()), // Navegar para a página de edição
                );
              },
              onDelete: () {
                // Lógica de exclusão
              },
            ),
          ],
        ),
      ),
    );
  }
}
