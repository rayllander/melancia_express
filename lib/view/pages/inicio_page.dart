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
      body: Center(
        child: Container(
          //margin: const EdgeInsets.all(75.0),
          width: 324,
          height: 490,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 158,
                height: 158,
                child: Image.asset('assets/images/logo.png'),
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
