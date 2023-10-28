import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(), // Usar o MyAppBar personalizado
      body: Center(
        child: Text('Conteúdo da página de cadastrar Anúncio'),
      ),
    );
  }
}
