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
          height: 405,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              //ESPAÇO EM BRANCO
              Container(
                height: 40,
                width: 275,
                child: TextButton(
                  onPressed: () {
                    goToRegister(context);
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      )),
                  child: const Text('CADASTRAR'),
                ),
              ),
              const SizedBox(height: 15),
              //ESPAÇO EM BRANCO
              Container(
                height: 40,
                width: 275,
                child: TextButton(
                  onPressed: () {
                    goToHome(context);
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      )),
                  child: const Text('LOGAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
