import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          //margin: const EdgeInsets.all(75.0),
          width: 324,
          height: 490,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFEA3026),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Ícone do Sistema
              Positioned(
                // left: 124,
                top: 83,
                child: Container(
                  width: 158,
                  height: 158,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              //Nome do Aplicativo
              const Text(
                'CADASTRO',
                style: TextStyle(fontSize: 20),
              ),
              //Espaço em branco
              const SizedBox(height: 15),
              //Input do nome
              MyTextField(
                  hintText: 'Nome',
                  obscureText: false,
                  controller: controllerUserName),
              //Espaço em branco
              const SizedBox(height: 10),
              //Input do email
              MyTextField(
                  hintText: 'Telefone',
                  obscureText: false,
                  controller: controllerEmail),
              const SizedBox(height: 10),
              //Input da senha
              MyTextField(
                  hintText: 'E-mail',
                  obscureText: true,
                  controller: controllerPass),
              const SizedBox(height: 10),
              //Input da confirme a senha
              MyTextField(
                  hintText: 'Senha',
                  obscureText: true,
                  controller: controllerConfirmPass),

              //Espaço em branco
              const SizedBox(height: 15),
              //Botão de login
              MyButton(
                buttonText: 'SALVAR',
                onTapButton: () {
                  displayMessage('Registrado', context);
                },
              ),
              //Espaço em branco
              const SizedBox(height: 20),
              //Possui uma conta? Faça login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      goToLogin(context);
                    },
                    child: Text(
                      'Possui uma conta? Faça login',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
