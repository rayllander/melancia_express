import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

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
              Positioned(
                left: 124,
                top: 83,
                child: Container(
                  width: 167,
                  height: 167,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const Text(
                'LOGIN',
                style: TextStyle(fontSize: 20),
              ),
              //Espaço em branco
              const SizedBox(height: 25),
              //Input do email
              MyTextField(
                  hintText: 'E-mail',
                  obscureText: false,
                  controller: controllerEmail),
              const SizedBox(height: 10),
              //Input da senha
              MyTextField(
                  hintText: 'Senha',
                  obscureText: true,
                  controller: controllerPass),
              //Esqueceu a senha
              const SizedBox(height: 10),

              //Espaço em branco
              const SizedBox(height: 20),
              //Botão de login
              MyButton(
                buttonText: 'ENTRAR',
                onTapButton: () {
                  goToHome(context);
                },
              ),
              //Espaço em branco
              const SizedBox(height: 20),
              //Não possui conta, registre-se
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      goToForgotPass(context);
                    },
                    child: Text(
                      'Esqueceu a senha? clique Aqui! ',
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
