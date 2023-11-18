import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnnouncementController {
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

  Future<String?> getUserId() async {
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser?.objectId;
  }

  Future<bool> saveAnnouncement({
    required String categoria,
    required String status,
    required int preco,
    required String data_colheita,
    required int telefone,
    required String email,
    required BuildContext context,
  }) async {
    try {
      // Validação de campos obrigatórios
      if (categoria.isEmpty ||
          status.isEmpty ||
          preco <= 0 ||
          data_colheita.isEmpty ||
          telefone <= 0 ||
          email.isEmpty) {
        print('Campos obrigatórios não podem ser vazios.');
        return false;
      }

      // Se necessário, você pode adicionar verificações adicionais aqui, como validar o formato da data, etc.

      // Continua com o salvamento do anúncio
      var userId = await getUserId();
      if (userId != null) {
        final announcement = ParseObject('Anuncio')
          ..set('categoria', categoria)
          ..set<int>('preco', preco)
          ..set('status', status)
          ..set('data_colheita', data_colheita)
          ..set<int>('telefone', telefone)
          ..set('email', email)
          ..set('usuario_pointer', userId);

        await announcement.save();
        print('Anúncio salvo com sucesso!');
        print('Anúncio salvo com os seguintes valores:');
        print('Categoria: $categoria');
        print('Preço: $preco');
        print('Status: $status');
        print('Data Colheita: $data_colheita');
        print('Telefone: $telefone');
        print('E-mail: $email');
        print('Usuario Pointer: $userId');
        return true;
      } else {
        print('Usuário não encontrado.');
        return false;
      }
    } catch (e) {
      print('Erro ao salvar o anúncio: $e');
      return false;
    }
  }
}
