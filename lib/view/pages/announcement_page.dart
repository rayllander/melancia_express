import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/components/my_Photofield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';


// ignore: must_be_immutable
class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({Key? key});

  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerHarvestDate = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'CRIAR ANÚNCIO'),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: PhotoField(
                  onImageSelected: (XFile? selectedImage) {
                    _selectedImage = selectedImage;
                  },
                ),
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'Categoria',
                obscureText: false,
                controller: controllerCategory,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'Data de colheita',
                obscureText: false,
                controller: controllerHarvestDate,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'Status',
                obscureText: false,
                controller: controllerStatus,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'Valor',
                obscureText: false,
                controller: controllerValue,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'Telefone',
                obscureText: false,
                controller: controllerTelephone,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: 'E-mail',
                obscureText: true,
                controller: controllerEmail,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: MyButton(
                  buttonText: 'SALVAR',
                  onTapButton: () async {
                    try {
                      await AnnouncementController().saveAnnouncement(
                        context: context,
                        category: controllerCategory.text,
                        harvestDate: controllerHarvestDate.text,
                        status: controllerStatus.text,
                        value: controllerValue.text,
                        telephone: controllerTelephone.text,
                        email: controllerEmail.text,
                        selectedImage: _selectedImage,
                      );

                      displayMessage('Anúncio salvo com sucesso!', context);
                    } catch (e) {
                      displayMessage('Erro ao salvar o anúncio.', context);
                      log(e.toString());
                    }
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
