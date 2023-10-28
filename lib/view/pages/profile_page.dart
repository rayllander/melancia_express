import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(), // Usar o MyAppBar personalizado
      body: Center(
        child: Text('Conteúdo da página de Perfil'),
      ),
    );
  }
}
