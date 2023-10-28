import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

class FilterPage extends StatelessWidget {
  FilterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'FILTRAR POR:'), // Usar o MyAppBar personalizado
      body: Center(
        child: Text('Conteúdo da página de filtrar'),
      ),
    );
  }
}
