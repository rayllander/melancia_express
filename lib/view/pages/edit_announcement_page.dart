import 'package:flutter/material.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_edittextfield.dart';
import 'package:melancia_express/view/components/my_editphotofield.dart';
import 'package:melancia_express/view/helpers/interface_helpers.dart';

// ignore: must_be_immutable
class EditAnnouncement extends StatelessWidget {
  EditAnnouncement({super.key});

  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerHarvestDate = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(title: 'EDITAR ANÚNCIO'), // Usar o MyAppBar personalizado
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 324,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          child: MyEditTextField(
                            hintText: 'Categoria',
                            obscureText: false,
                            controller: controllerCategory,
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: 180,
                          child: MyEditTextField(
                            hintText: 'Data de colheita',
                            obscureText: false,
                            controller: controllerHarvestDate,
                          ),
                        ),
                      ],
                    ),
                    // Substitua a seção da imagem do anúncio pelo PhotoField
                    PhotoFieldEdit(
                      onTap: () {
                        // Lógica para selecionar a imagem
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      child: MyEditTextField(
                        hintText: 'Status',
                        obscureText: false,
                        controller: controllerStatus,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      child: MyEditTextField(
                        hintText: 'Valor',
                        obscureText: false,
                        controller: controllerValue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  width: 400,
                  child: MyEditTextField(
                    hintText: 'Telefone',
                    obscureText: false,
                    controller: controllerTelephone,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: 400,
                  child: MyEditTextField(
                    hintText: 'E-mail',
                    obscureText: true,
                    controller: controllerEmail,
                  ),
                ),
                SizedBox(height: 180),
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
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}