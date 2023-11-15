/*
import 'dart:developer';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AnnouncementController {
  Future<void> saveAnnouncement({
    required String category,
    required String harvestDate,
    required String status,
    required String value,
    required String telephone,
    required String email,
    XFile? selectedImage,
    required BuildContext context,
  }) async {
    /** PEGAR USUÁRIO LOGADO */
    var userContoller = UserController();
    ParseUser? user;
    userContoller.getUserLogged().then((value) => user);
    log(user.toString());
    // ignore: unnecessary_null_comparison
    if (user == null) {
      log('erro usuario');
    }
    /** SALVAR O ANUNCIO */
    final announcment = ParseObject('Anuncio')
      ..set('categoria', category)
      ..set('status', status)
      ..set('preco', value)
      ..set('data_colheita', harvestDate)
      ..set('telefone', telephone)
      ..set('email', email)
      ..set('usuario_pointer',
          (ParseObject('Usuario')..objectId = user!.objectId).toPointer());
    ;

    try {
      await announcment.save();
    } catch (e) {
      log(e.toString());
    }
  }
}
*/



