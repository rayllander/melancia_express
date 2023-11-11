import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/model/user_model.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController controllerUserName = TextEditingController();

  final TextEditingController controllerPhoneNumber = TextEditingController();

  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPass = TextEditingController();

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
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEA3026),
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
                        'CADASTRO',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                        hintText: 'Nome',
                        obscureText: false,
                        controller: controllerUserName,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintText: 'Telefone',
                        obscureText: false,
                        controller: controllerPhoneNumber,
                      ),
                      const SizedBox(height: 10),
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
                        buttonText: 'SALVAR',
                        onTapButton: () async {
                          // Cria uma instância do UserModel com os dados do formulário
                          UserModel newUser = UserModel(
                            username: controllerUserName.text,
                            telefone:
                                int.tryParse(controllerPhoneNumber.text) ?? 0,
                            email: controllerEmail.text,
                            password: controllerPass.text,
                          );

                          // Imprima os valores para debug
                          print('Username: ${newUser.username}');
                          print('Telefone: ${newUser.telefone}');
                          print('Email: ${newUser.email}');
                          print('Senha: ${newUser.password}');

                          // Chama o método signUp do UserController
                          bool registrationSuccess =
                              await UserController().signUp(newUser);

                          if (registrationSuccess) {
                            // Registro bem-sucedido, exibe mensagem ou navega para outra tela
                            displayMessage('Registrado com sucesso', context);
                          } else {
                            // Registro falhou, exibe mensagem de erro ou realiza ações apropriadas
                            displayMessage(
                                'Erro ao registrar usuário', context);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => goToLogin(context),
                            child: const Text('Possui uma conta? '),
                          ),
                          GestureDetector(
                            onTap: () => goToLogin(context),
                            child: const Text(
                              'Faça login',
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
