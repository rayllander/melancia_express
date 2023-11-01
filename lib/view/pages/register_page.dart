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
                        // Ícone do Sistema
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 184,
                          ),
                        ),
                        const Text(
                          'CADASTRO',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 15),
                        // Input do nome
                        MyTextField(
                          hintText: 'Nome',
                          obscureText: false,
                          controller: controllerUserName,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          hintText: 'Telefone',
                          obscureText: false,
                          controller: controllerEmail,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          hintText: 'E-mail',
                          obscureText: true,
                          controller: controllerPass,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          hintText: 'Senha',
                          obscureText: true,
                          controller: controllerConfirmPass,
                        ),
                        const SizedBox(height: 15),
                        MyButton(
                          buttonText: 'SALVAR',
                          onTapButton: () {
                            displayMessage('Registrado', context);
                          },
                        ),
                        const SizedBox(height: 20),
                        // Possui uma conta? Faça login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                goToLogin(context);
                              },
                              child: Text(
                                'Possui uma conta? ',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                goToLogin(context);
                              },
                              child: Text(
                                'Faça login',
                                style: TextStyle(
                                  color: Color(0xFFEA3026), // Cor definida aqui
                                ),
                              ),
                            ),
                          ],
                        ),
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
