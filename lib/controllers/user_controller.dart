import 'dart:developer';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:melancia_express/model/user_model.dart';

class UserController {
  final keyApplicationId = 'AQL5f7yf0TkgXSzsSofkl1l12lvy4PWBKikMSEmv';
  final keyClientKey = 'OVIBKpgVEjdWiuEsOoPG1kHCtS3BSAM4K6a2SIEI';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  Future<void> initializeParse() async {
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
    );
  }

  /////////
  Future<bool> signUp(UserModel newUser) async {
    try {
      await initializeParse();

      // Verifica se os campos obrigatórios não são nulos
      if (newUser.username.isEmpty ||
          newUser.password.isEmpty ||
          newUser.email.isEmpty) {
        print('Campos obrigatórios não podem ser vazios.');
        return false;
      }

      // Verifica se o e-mail já está em uso
      final emailQuery = QueryBuilder(ParseObject('User'))
        ..whereEqualTo('email', newUser.email);
      final emailCheckResults = await emailQuery.query();
      if (emailCheckResults.results != null &&
          emailCheckResults.results!.isNotEmpty) {
        print('E-mail já cadastrado. Escolha outro e-mail.');
        return false;
      }

      // Se não houver nenhum usuário com o mesmo e-mail, continua com o cadastro
      final parseUser =
          ParseUser(newUser.username, newUser.password, newUser.email)
            ..set<int>('telefone', newUser.telefone);

      await parseUser.signUp();
      print('Usuário registrado com sucesso!');
      return true;
    } catch (e) {
      if (e is ParseError) {
        print('Erro ao registrar usuário: ${e.message}');
        print('Código de erro: ${e.code}');
      } else {
        print('Erro desconhecido ao registrar usuário: $e');
      }
      return false;
    }
  }

  /////////////
  Future<bool> loginUser(String email, String password) async {
    try {
      final ParseUser user = ParseUser(email, password, null);

      final ParseResponse userResponse = await user.login();

      if (userResponse.success) {
        // O login bem-sucedido
        print('Usuário fez login com sucesso: ${user.objectId}');
        return true; // Adiciona esta linha para indicar sucesso
      } else {
        // Erros de login
        print('Erro ao fazer login: ${userResponse.error}');
        return false; // Adiciona esta linha para indicar falha
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      return false; // Adiciona esta linha para indicar falha em caso de exceção
    }
  }

  ///////
  Future<void> logoutUser() async {
    try {
      final ParseUser? currentUser = await ParseUser.currentUser();
      if (currentUser != null) {
        await currentUser.logout();
        print('Usuário desconectado com sucesso.');
      } else {
        print('Nenhum usuário logado.');
      }
    } catch (e) {
      print('Erro ao fazer logout: $e');
    }
  }

  /////////
  Future<bool> hasUserLogged() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    log('current user ---------------------------------------');
    log(currentUser.toString());
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse =
        await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    log('response ---------------------------------------');
    var test = parseResponse?.success;
    log(test.toString());

    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();
      return false;
    } else {
      return true;
    }
  }
}
