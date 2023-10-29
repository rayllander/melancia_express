import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class MyPerfil extends StatelessWidget {
  MyPerfil({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Meu Perfil:'), // Usar o MyAppBar personalizado
      body: Center(
        child: Text('Conteúdo da página de Perfil do usuario'),
      ),
    );
  }
}
