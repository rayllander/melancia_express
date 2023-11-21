import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_blocktextfield.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_edittextfield.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyPerfil extends StatefulWidget {
  const MyPerfil({Key? key}) : super(key: key);

  @override
  _MyPerfilState createState() => _MyPerfilState();
}

class _MyPerfilState extends State<MyPerfil> {
  TextEditingController? controllerUserName;
  TextEditingController? controllerTelefone;
  TextEditingController? controllerEmail;
  TextEditingController? controllerPass;

  @override
  void initState() {
    super.initState();
    // Inicialize os controladores com os dados do usuário atual
    initializeControllers();
  }

  Future<void> initializeControllers() async {
    UserController userController = UserController();
    await userController.initializeParse();
    ParseUser? currentUser = await userController.getUser();

    setState(() {
      controllerUserName =
          TextEditingController(text: currentUser?.username ?? '');
      controllerTelefone = TextEditingController(
          text: currentUser?.get<int>('telefone')?.toString() ?? '');
      controllerEmail =
          TextEditingController(text: currentUser?.get<String>('email') ?? '');
      controllerPass = TextEditingController(); // A senha não deve ser exibida
    });
  }

  @override
  Widget build(BuildContext context) {
    // Verifique se os controladores foram inicializados antes de construir o widget
    if (controllerUserName == null ||
        controllerTelefone == null ||
        controllerEmail == null ||
        controllerPass == null) {
      return CircularProgressIndicator(); // ou qualquer indicador de carregamento que você preferir
    }

    return Scaffold(
      appBar: MyAppBar(title: controllerUserName!.text),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyEditTextField(
                hintText: 'Nome',
                obscureText: false,
                controller: controllerUserName!,
              ),
              const SizedBox(height: 15),
              MyEditTextField(
                hintText: 'Telefone',
                obscureText: false,
                controller: controllerTelefone!,
              ),
              const SizedBox(height: 15),
              MyBlockTextField(
                hintText: 'Email',
                obscureText: false,
                controller: controllerEmail!,
              ),
              const SizedBox(height: 15),
              MyBlockTextField(
                hintText: 'Senha',
                obscureText: true,
                controller: controllerPass!,
              ),
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.all(60.0),
                child: MyButton(
                  buttonText: 'SALVAR',
                  onTapButton: () async {
                    UserController userController = UserController();
                    await userController.initializeParse();
                    await userController.saveUserChanges(
                      username: controllerUserName!.text,
                      telefone: controllerTelefone!.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
