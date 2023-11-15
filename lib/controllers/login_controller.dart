import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginController {
  final keyApplicationId = 'AQL5f7yf0TkgXSzsSofkl1l12lvy4PWBKikMSEmv';
  final keyClientKey = 'OVIBKpgVEjdWiuEsOoPG1kHCtS3BSAM4K6a2SIEI';
  final String keyParseServerUrl = 'https://parseapi.back4app.com';

  Future<void> initializeParse() async {
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
    );
  }

  Future<bool> loginUser(String email, String password) async {
    await initializeParse();

    try {
      final ParseUser user = ParseUser(email, password, null);

      final ParseResponse userResponse = await user.login();

      if (userResponse.success) {
        // O login bem-sucedido
        print('Usuário fez login com sucesso: ${user.objectId}');
        return true; 
      } else {
        print('Erro ao fazer login: ${userResponse.error}');
        return false; 
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      return false; 
    }
  }

  Future<void> logoutUser() async {
    await initializeParse();

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
}
