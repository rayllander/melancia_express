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
import 'package:melancia_express/view/helpers/rout_helpers.dart';

class AnnouncementPage extends StatefulWidget {
  AnnouncementPage({Key? key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  DateTime? selectedDate;
  XFile? selectedImage;

  late String selectedCategory;
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedCategory = AnnouncementController.categoriasDisponiveis.first;
    selectedStatus = AnnouncementController.statusDisponiveis.first;
  }

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
                    this.selectedImage = selectedImage;
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildDropDownField(
                      label: 'Categoria',
                      value: selectedCategory,
                      onTap: () {
                        _showCategoryPicker(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: _buildDropDownField(
                      label: 'Status',
                      value: selectedStatus,
                      onTap: () {
                        _showStatusPicker(context);
                      },
                    ),
                  ),
                ],
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
                      if (selectedCategory.isEmpty ||
                          controllerDatetime.text.isEmpty ||
                          selectedStatus.isEmpty ||
                          controllerValue.text.isEmpty ||
                          controllerTelephone.text.isEmpty ||
                          controllerEmail.text.isEmpty ||
                          selectedImage == null) {
                        displayMessage(
                            'Preencha todos os campos obrigatórios', context,
                            onButtonPressed: () {}, buttonText: '');
                        return;
                      }

                      final preco = double.tryParse(controllerValue.text) ?? 0;
                      final telefone =
                          int.tryParse(controllerTelephone.text) ?? 0;

                      final success =
                          await AnnouncementController().saveAnnouncement(
                        categoria: selectedCategory,
                        data_colheita: selectedDate ?? DateTime.now(),
                        status: selectedStatus,
                        preco: preco,
                        telefone: telefone,
                        email: controllerEmail.text,
                        foto: selectedImage,
                        context: context,
                      );

                      if (success) {
                        // Exibir mensagem com informações sobre o anúncio salvo
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Anúncio Salvo com Sucesso!'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Categoria: $selectedCategory'),
                                  Text('Preço: ${preco.toString()}'),
                                  Text('Status: $selectedStatus'),
                                  Text(
                                      'Data Colheita: ${DateFormat('dd/MM/yyyy').format(selectedDate ?? DateTime.now())}'),
                                  Text('Telefone: ${telefone.toString()}'),
                                  Text('E-mail: ${controllerEmail.text}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Fechar o diálogo
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        // Limpar os campos após o sucesso
                        controllerValue.clear();
                        controllerTelephone.clear();
                        controllerEmail.clear();
                        controllerDatetime.clear();
                        selectedDate = null;
                        selectedImage = null;

                        // Navegar para a tela inicial
                        goToHome(context);
                      } else {
                        displayMessage('Erro ao salvar o anúncio.', context,
                            onButtonPressed: () {}, buttonText: '');
                      }
                    } catch (e) {
                      displayMessage('Erro ao salvar o anúncio: $e', context,
                          onButtonPressed: () {}, buttonText: '');
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

  Widget _buildDropDownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color.fromARGB(255, 211, 211, 211),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 249, 248, 248), // Cor das bordas
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(value),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: AnnouncementController.categoriasDisponiveis.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text(AnnouncementController.categoriasDisponiveis[index]),
                onTap: () {
                  setState(() {
                    selectedCategory =
                        AnnouncementController.categoriasDisponiveis[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showStatusPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: AnnouncementController.statusDisponiveis.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(AnnouncementController.statusDisponiveis[index]),
                onTap: () {
                  setState(() {
                    selectedStatus =
                        AnnouncementController.statusDisponiveis[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
