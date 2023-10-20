import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

// ignore: must_be_immutable
class inicioPage extends StatelessWidget {
  inicioPage({super.key});

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
                'BEM VIND@',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              //ESPAÇO EM BRANCO
              MyButton(
                buttonText: 'CADASTRAR',
                onTapButton: () {
                  goToRegister(context);
                },
              ),
              const SizedBox(height: 20),
              MyButton(
                buttonText: 'LOGAR',
                onTapButton: () {
                  goToHome(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
