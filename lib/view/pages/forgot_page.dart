import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class ForgotPage extends StatelessWidget {
  ForgotPage({super.key});

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

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
                left: 124,
                top: 83,
                child: Container(
                  width: 167,
                  height: 167,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              //Nome do Aplicativo
              const Text(
                'RECUPERAÇÃO DE SENHA',
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
              MyButton(
                buttonText: 'CONFIRMAR',
                onTapButton: () {},
              ),
              //Espaço em branco
              const SizedBox(height: 20),
              //Voltar ao login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      goToInicio(context);
                    },
                    child: Text(
                      'Voltar ao inicio',
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
