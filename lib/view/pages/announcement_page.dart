import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_textfield.dart';
import 'package:melancia_express/view/components/my_PhotoField.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';
import 'package:melancia_express/view/components/my_appbar.dart';

// ignore: must_be_immutable
class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({Key? key});

  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerHarvestDate = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'CRIAR ANÚNCIO'),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          width: 324,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        child: MyTextField(
                          hintText: 'Categoria',
                          obscureText: false,
                          controller: controllerCategory,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 180,
                        child: MyTextField(
                          hintText: 'Data de colheita',
                          obscureText: false,
                          controller: controllerHarvestDate,
                        ),
                      ),
                    ],
                  ),
                  // Substitua a seção da imagem do anúncio pelo PhotoField
                  PhotoField(
                    onTap: () {
                      // Lógica para selecionar a imagem
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    child: MyTextField(
                      hintText: 'Status',
                      obscureText: false,
                      controller: controllerStatus,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 120,
                    child: MyTextField(
                      hintText: 'Valor',
                      obscureText: false,
                      controller: controllerValue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                child: MyTextField(
                  hintText: 'Telefone',
                  obscureText: false,
                  controller: controllerTelephone,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                child: MyTextField(
                  hintText: 'E-mail',
                  obscureText: true,
                  controller: controllerEmail,
                ),
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    buttonText: 'SALVAR',
                    onTapButton: () {
                      displayMessage('Registrado', context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
