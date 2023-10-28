import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class ForgotPage extends StatelessWidget {
  ForgotPage({super.key});

  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
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
                'RECUPERAÇÃO DE SENHA',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              //Input do email
              Container(
                width: 270,
                child: MyTextField(
                  hintText: 'E-mail',
                  obscureText: false,
                  controller: controllerEmail,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 270,
                child: MyButton(
                  buttonText: 'CONFIRMAR',
                  onTapButton: () {},
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      goToInicio(context);
                    },
                    child: Text(
                      'Voltar ao início',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
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
