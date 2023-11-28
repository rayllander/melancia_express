import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// ignore: must_be_immutable
class ForgotPage extends StatelessWidget {
  ForgotPage({Key? key}) : super(key: key);

  TextEditingController controllerEmail = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    try {
      // Validação do campo de e-mail
      if (controllerEmail.text.isEmpty) {
        displayMessage('preencha com seu email', context,
            onButtonPressed: () {}, buttonText: '');

        return;
      }

      ParseUser user = ParseUser(null, null, controllerEmail.text);

      // Solicitar redefinição de senha
      await user.requestPasswordReset();

      displayMessage(
          'Solicitação de redefinição de senha enviada com sucesso. Um email foi enviado para a redefinição!',
          context,
          onButtonPressed: () {},
          buttonText: '');
    } catch (e) {
      displayMessage('Erro ao solicitar redefinição de senha: $e', context,
          onButtonPressed: () {}, buttonText: '');
    }
  }

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
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 184,
                        ),
                      ),
                      const Text(
                        'RECUPERAÇÃO DE SENHA',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 25),
                      // Input do email
                      MyTextField(
                        hintText: 'E-mail',
                        obscureText: false,
                        controller: controllerEmail,
                      ),
                      const SizedBox(height: 15),
                      MyButton(
                        buttonText: 'CONFIRMAR',
                        onTapButton: () => resetPassword(context),
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
