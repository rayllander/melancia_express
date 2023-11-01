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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PhotoField(
                              onTap: () {
                                // Lógica para selecionar a imagem
                              },
                            ),
                            SizedBox(height: 20),
                            MyTextField(
                              hintText: 'Valor',
                              obscureText: false,
                              controller: controllerValue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
