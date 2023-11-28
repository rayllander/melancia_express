import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProfilePage extends StatelessWidget {
  final UserController _userController = UserController();

  Future<ParseUser?> getUser() async {
    var currentUser = await _userController.getUser();
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParseUser?>(
      future: getUser(),
      builder: (context, snapshot) {
        var username = (snapshot.data != null)
            ? snapshot.data!.get<String>('username')
            : 'Usuário não encontrado';

        return Scaffold(
          appBar: MyAppBar(title: '$username'),
          body: Padding(
            padding: EdgeInsets.all(65),
            child: Center(
              child: Column(
                children: [
                  MyButton(
                    buttonText: 'MEU PERFIL',
                    onTapButton: () {
                      goToMyPerfil(context);
                    },
                  ),
                  SizedBox(height: 30),
                  MyButton(
                    buttonText: 'MEUS ANÚNCIOS',
                    onTapButton: () {
                      goToMyAnnouncement(context);
                    },
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                        await _userController.logoutUser();
                        goToInicio(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app, color: Color(0xFFEA3026)),
                          SizedBox(width: 5),
                          Text('SAIR',
                              style: TextStyle(color: Color(0xFFEA3026))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: MyBottomBar(),
        );
      },
    );
  }
}
