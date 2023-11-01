import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class inicioPage extends StatelessWidget {
  inicioPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
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
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 184,
                          ),
                        ), //Nome do Aplicativo
                        const Text(
                          'BEM VIND@',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyButton(
                          buttonText: 'CADASTRAR',
                          onTapButton: () {
                            goToRegister(context);
                          },
                        ),
                        const SizedBox(height: 15),
                        MyButton(
                          buttonText: 'LOGAR',
                          onTapButton: () {
                            goToLogin(context);
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
