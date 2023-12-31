import 'dart:io';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AnnouncementController {
  final keyApplicationId = 'AQL5f7yf0TkgXSzsSofkl1l12lvy4PWBKikMSEmv';
  final keyClientKey = 'OVIBKpgVEjdWiuEsOoPG1kHCtS3BSAM4K6a2SIEI';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  static const List<String> categoriasDisponiveis = [
    'Sem semente',
    'Polpa Amarela',
    'Polpa Vermelha',
    'Polpa Branca',
    'Pretinha',
    'Tradicional',
  ];

  static const List<String> statusDisponiveis = [
    'Plantio',
    'Crescimento',
    'Colheita 1ª Panha',
    'Colheita 2ª Panha',
    'Colheita 3ª Panha',
  ];

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

  Future<List<ParseObject>> getUserAnnouncements() async {
    try {
      var userId = await getUserId();
      if (userId != null) {
        var queryBuilder = QueryBuilder(ParseObject('Anuncio'))
          ..whereEqualTo(
              'usuario_pointer', ParseObject('_User')..set('objectId', userId));

        var response = await queryBuilder.query();
        if (response.success && response.results != null) {
          return response.results as List<ParseObject>;
        }
      }
      return [];
    } catch (e) {
      print('Erro ao obter os anúncios do usuário: $e');
      return [];
    }
  }

  Future<bool> deleteAnnouncement(String announcementId) async {
    try {
      final ParseObject announcement = ParseObject('Anuncio')
        ..set('objectId', announcementId);
      final response = await announcement.delete();
      return response.success;
    } catch (e) {
      print('Erro ao excluir o anúncio: $e');
      return false;
    }
  }

  Future<bool> saveAnnouncement({
    required String categoria,
    required String status,
    required double preco,
    required DateTime data_colheita,
    required int telefone,
    required String email,
    XFile? foto,
    required BuildContext context,
  }) async {
    try {
      // Validação de campos obrigatórios
      if (categoria.isEmpty ||
          status.isEmpty ||
          preco <= 0 ||
          telefone <= 0 ||
          email.isEmpty) {
        print('Campos obrigatórios não podem ser vazios.');
        return false;
      }

      // Verifica se a categoria e o status são válidos
      if (!categoriasDisponiveis.contains(categoria) ||
          !statusDisponiveis.contains(status)) {
        print('Categoria ou status inválido.');
        return false;
      }

      // Continua com o salvamento do anúncio
      var userId = await getUserId();
      if (userId != null) {
        final announcement = ParseObject('Anuncio')
          ..set('categoria', categoria)
          ..set<double>('preco', preco)
          ..set('status', status)
          ..set('data_colheita', data_colheita)
          ..set<int>('telefone', telefone)
          ..set('email', email);

        // Faz o upload da imagem
        ParseFileBase? parseFile;

        if (kIsWeb) {
          // Flutter Web
          parseFile = ParseWebFile(
            await foto?.readAsBytes(),
            name: 'anuncio_foto.jpg',
          );
        } else {
          // Flutter Mobile
          parseFile = ParseFile(File(foto!.path), name: 'anuncio_foto.jpg');
        }

        // Salva o ParseFile antes de usar a URL
        await parseFile.save();
        print('ParseFile salvo com sucesso. URL da Imagem: ${parseFile.url}');

        announcement.set<ParseFileBase>('foto', parseFile);

        // Cria um ponteiro para o usuário
        var userPointer = ParseObject('_User')..set('objectId', userId);
        announcement.set<ParseObject>('usuario_pointer', userPointer);

        print('Objeto Announcement antes de salvar: $announcement');

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

  Future<List<ParseObject>> getAllAnnouncements() async {
    try {
      var queryBuilder = QueryBuilder(ParseObject('Anuncio'));

      var response = await queryBuilder.query();
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }

      return [];
    } catch (e) {
      print('Erro ao obter os anúncios: $e');
      return [];
    }
  }

//função em testes:
  Future<List<ParseObject>> getFilteredAnnouncements(
      String categoria, String status) async {
    try {
      var queryBuilder = QueryBuilder(ParseObject('Anuncio'))
        ..whereEqualTo('categoria', categoria)
        ..whereEqualTo('status', status);

      var response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }

      return [];
    } catch (e) {
      print('Erro ao obter os anúncios filtrados: $e');
      return [];
    }
  }

  searchAnnouncementsByCategory(String searchTerm) {}
}
