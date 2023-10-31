import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_banner.dart';

class MyAnnouncement extends StatelessWidget {
  MyAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'MEUS ANÚNCIOS'), // Usar o MyAppBar personalizado
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Alinhar no início da coluna
              children: [
                MyBanner(
                  imagePath: 'assets/images/logo.png', // Especifique o caminho da imagem
                  onEdit: () {
                    // Lógica de edição
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
                  },
                  onDelete: () {
                    // Lógica de exclusão
                  },
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
