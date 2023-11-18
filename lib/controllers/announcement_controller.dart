import 'dart:developer';
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

  Future<bool> saveAnnouncement({
    required String categoria,
    required String status,
    required int preco,
    required String data_colheita,
    required int telefone,
    required String email,
    required String usuario_pointer,
    required BuildContext context,
  }) async {
    try {
      final announcement = ParseObject('Anuncio')
        ..set('categoria', categoria)
        ..set<int>('preco', preco)
        ..set('status', status)
        ..set('data_colheita', data_colheita)
        ..set<int>('telefone', telefone)
        ..set('email', email)
        ..set('usuario_pointer', usuario_pointer);

      await announcement.save();
      log('Anúncio salvo com sucesso!');
      // Imprimir os valores após o anúncio ter sido salvo
      print('Anúncio salvo com os seguintes valores:');
      print('Categoria: $categoria');
      print('Preço: $preco');
      print('Status: $status');
      print('Data Colheita: $data_colheita');
      print('Telefone: $telefone');
      print('E-mail: $email');
      print('Usuario Pointer: $usuario_pointer');
      return true;
    } catch (e) {
      log('Erro ao salvar o anúncio: $e');
      return false;
    }
  }
}
