import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/view/pages/home_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  bool isLogged = false;

  UserController _userController = UserController();

  Future<ParseUser?> getUser() async {
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    UserController user = UserController();
    user.hasUserLogged().then((value) => isLogged);

    if (isLogged) {
      //redirecionar home
      return HomePage();
    } else {
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
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 184,
                          ),
                        ),
                        const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 25),
                        MyTextField(
                          hintText: 'E-mail',
                          obscureText: false,
                          controller: controllerEmail,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          hintText: 'Senha',
                          obscureText: true,
                          controller: controllerPass,
                        ),
                        const SizedBox(height: 15),
                        MyButton(
                          buttonText: 'ENTRAR',
                          onTapButton: () async {
                            // Validação dos campos
                            if (controllerEmail.text.isEmpty ||
                                controllerPass.text.isEmpty) {
                              displayMessage(
                                  'preencha todos os campos', context);
                              return;
                            }
                            //método de login do LoginController
                            try {
                              bool loginSuccess =
                                  await _userController.loginUser(
                                controllerEmail.text,
                                controllerPass.text,
                              );

                              if (loginSuccess) {
                                goToHome(context);
                              } else {
                                displayMessage(
                                    'usuario não encontrado', context);
                              }
                            } catch (e) {
                              print('Erro ao fazer login: $e');
                              displayMessage('ERRO', context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                goToForgotPass(context);
                              },
                              child: Text(
                                'Esqueceu a senha? ',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                goToForgotPass(context);
                              },
                              child: Text(
                                'clique Aqui!',
                                style: TextStyle(
                                  color: Color(0xFFEA3026),
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
        ),
      );
    }
  }
}
