import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_edittextfield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';

// ignore: must_be_immutable
class MyPerfil extends StatelessWidget {
  MyPerfil({super.key});
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'MEU PERFIL'),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyEditTextField(
                hintText: 'Nome',
                obscureText: false,
                controller: controllerUserName,
              ),
              const SizedBox(height: 15),
              MyEditTextField(
                hintText: 'Telefone',
                obscureText: false,
                controller: controllerEmail,
              ),
              const SizedBox(height: 15),
              MyEditTextField(
                hintText: 'Email',
                obscureText: false,
                controller: controllerEmail,
              ),
              const SizedBox(height: 15),
              MyEditTextField(
                hintText: 'Senha',
                obscureText: true,
                controller: controllerPass,
              ),
              const SizedBox(height: 100),
              MyButton(
                buttonText: 'SALVAR',
                onTapButton: () {
                  displayMessage('Registrado', context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
