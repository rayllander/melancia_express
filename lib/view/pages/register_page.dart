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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Ícone do Sistema
              Positioned(
                left: 124,
                top: 83,
                child: Container(
                  width: 167,
                  height: 167,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              //Espaço embranco
              const SizedBox(height: 5),
              //Nome do Aplicativo
              const Text(
                'CADASTRO',
                style: TextStyle(fontSize: 20),
              ),
              //Espaço em branco
              const SizedBox(height: 25),
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
              const SizedBox(height: 20),
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
