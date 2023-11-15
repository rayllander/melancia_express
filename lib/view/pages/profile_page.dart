import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/helpers/rout_helpers.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProfilePage extends StatelessWidget {
  final UserController _UserController = UserController();

  Future<ParseUser?> getUser() async {
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'USUÁRIO'),
      body: Padding(
        padding: EdgeInsets.all(65),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
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
                    await _UserController.logoutUser();
                    goToInicio(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Color(0xFFEA3026)),
                      SizedBox(width: 5),
                      Text('SAIR', style: TextStyle(color: Color(0xFFEA3026))),
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
  }
}
