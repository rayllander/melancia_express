import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/components/my_Photofield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';

// ignore: must_be_immutable
class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({Key? key});

  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDatetime = TextEditingController();

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
                    //_selectedImage = selectedImage;
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
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    controllerDatetime.text = formattedDate;
                    selectedDate = pickedDate;
                  }
                },
                child: MyTextField(
                  hintText: 'Data de colheita (dia/mês/ano)',
                  obscureText: false,
                  controller: controllerDatetime,
                ),
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
                obscureText: false,
                controller: controllerEmail,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: MyButton(
                  buttonText: 'SALVAR',
                  onTapButton: () async {
                    try {
                      if (controllerCategory.text.isEmpty ||
                          controllerDatetime.text.isEmpty ||
                          controllerStatus.text.isEmpty ||
                          controllerValue.text.isEmpty ||
                          controllerTelephone.text.isEmpty ||
                          controllerEmail.text.isEmpty) {
                        displayMessage(
                            'Preencha todos os campos obrigatórios', context);
                        return;
                      }

                      final preco = double.tryParse(controllerValue.text) ?? 0;
                      final telefone =
                          int.tryParse(controllerTelephone.text) ?? 0;

                      final success =
                          await AnnouncementController().saveAnnouncement(
                        categoria: controllerCategory.text,
                        data_colheita: selectedDate ?? DateTime.now(),
                        status: controllerStatus.text,
                        preco: preco,
                        telefone: telefone,
                        email: controllerEmail.text,
                        context: context,
                      );

                      if (success) {
                        displayMessage('Anúncio salvo com sucesso!', context);
                      } else {
                        displayMessage('Erro ao salvar o anúncio.', context);
                      }
                    } catch (e) {
                      displayMessage('Erro ao salvar o anúncio: $e', context);
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
