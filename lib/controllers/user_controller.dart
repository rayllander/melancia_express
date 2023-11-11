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
}
