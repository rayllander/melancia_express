import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    UserController user = UserController();
    isLogged = await user.hasUserLogged();

    if (isLogged) {
      // Se estiver logado, redirecione para a HomePage
      goToHome(context);
    } else {
      // Permanece no início
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Impede que o usuário volte à tela anterior
        return false;
      },
      child: Scaffold(
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
                        ), // Nome do Aplicativo
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
        ),
      ),
    );
  }
}
