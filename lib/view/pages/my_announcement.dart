import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class MyAnnouncement extends StatelessWidget {
  MyAnnouncement({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(title: 'Meus Anuncios:'), // Usar o MyAppBar personalizado
      body: Center(
        child: Text('Conteúdo da página dos anúncios do usuario'),
      ),
    );
  }
}
