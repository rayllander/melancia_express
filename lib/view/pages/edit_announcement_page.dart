import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_editphotofield.dart';
import 'package:melancia_express/view/components/my_edittextfield.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class EditAnnouncement extends StatefulWidget {
  final String announcementId;

  EditAnnouncement({Key? key, required this.announcementId}) : super(key: key);

  @override
  _EditAnnouncementState createState() => _EditAnnouncementState();
}

class _EditAnnouncementState extends State<EditAnnouncement> {
  String? selectedCategory;
  String? selectedStatus;
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerDatetime = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  DateTime? selectedDate;
  XFile? selectedImage;
  String? imageUrl;
  final List<String> statusOptions = [
    'Plantio',
    'Crescimento',
    'Colheita 1ª Panha',
    'Colheita 2ª Panha',
    'Colheita 3ª Panha',
  ];

  // Opções para o campo Categoria
  final List<String> categoryOptions = [
    'Sem semente',
    'Polpa Amarela',
    'Polpa Vermelha',
    'Polpa Branca',
    'Pretinha',
    'Tradicional'
  ];
  @override
  void initState() {
    super.initState();
    _loadAnnouncementData();
  }

  void _loadAnnouncementData() async {
    try {
      var announcements = await AnnouncementController().getAllAnnouncements();
      var announcementToEdit = announcements.firstWhere(
        (announcement) => announcement.objectId == widget.announcementId,
        orElse: () => ParseObject('Anuncio'),
      );

      if (announcementToEdit != null) {
        setState(() {
          selectedCategory = announcementToEdit.get('categoria') ?? '';
          selectedStatus = announcementToEdit.get('status') ?? '';
          controllerCategory.text = announcementToEdit.get('categoria') ?? '';
          controllerDatetime.text = DateFormat('dd/MM/yyyy').format(
              announcementToEdit.get<DateTime>('data_colheita') ??
                  DateTime.now());
          controllerStatus.text = announcementToEdit.get('status') ?? '';
          controllerValue.text =
              announcementToEdit.get<double>('preco')?.toString() ?? '';
          controllerTelephone.text =
              announcementToEdit.get<int>('telefone')?.toString() ?? '';
          controllerEmail.text = announcementToEdit.get('email') ?? '';

          var foto = announcementToEdit.get<ParseFileBase>('foto');
          if (foto != null) {
            imageUrl = foto.url;
          }
        });
      } else {
        print('Anúncio não encontrado');
      }
    } catch (e) {
      print('Erro ao carregar os dados do anúncio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'EDITAR ANÚNCIO'),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              PhotoFieldEdit(
                onTap: () async {
                  XFile? xFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    selectedImage = xFile;
                  });
                },
                imageUrl: imageUrl,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: categoryOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue ?? '';
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  filled: true,
                  fillColor: Color(0xFFD9D9D9), // Cor cinza
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 98, 215, 56)),
                  ),
                ),
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
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: MyEditTextField(
                  hintText: 'Data de colheita (dia/mês/ano)',
                  obscureText: false,
                  controller: controllerDatetime,
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: statusOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStatus = newValue;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MyEditTextField(
                hintText: 'Valor',
                obscureText: false,
                controller: controllerValue,
              ),
              SizedBox(height: 20),
              MyEditTextField(
                hintText: 'Telefone',
                obscureText: false,
                controller: controllerTelephone,
              ),
              SizedBox(height: 20),
              MyEditTextField(
                hintText: 'E-mail',
                obscureText: false,
                controller: controllerEmail,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: MyButton(
                  buttonText: 'SALVAR',
                  onTapButton: () {
                    _saveAnnouncement();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveAnnouncement() async {
    try {
      ParseObject announcement = ParseObject('Anuncio');

      // Adicionando prints para depuração
      print('Selected Category: $selectedCategory');
      print('Selected Status: $selectedStatus');

      // Certifique-se de que selectedCategory e selectedStatus não são nulos ou vazios
      if (selectedCategory == null || selectedStatus == null) {
        print('Selected Category or Status is null or empty. Aborting save.');
        return;
      }

      announcement.set('categoria', selectedCategory);
      DateTime formattedDate =
          DateFormat('dd/MM/yyyy').parse(controllerDatetime.text);
      announcement.set<DateTime>('data_colheita', formattedDate);
      announcement.set('status', selectedStatus);
      announcement.set<double>(
          'preco', double.tryParse(controllerValue.text) ?? 0.0);
      announcement.set<int>(
          'telefone', int.tryParse(controllerTelephone.text) ?? 0);
      announcement.set('email', controllerEmail.text);

      if (selectedImage != null) {
        ParseFileBase imageFile = ParseFile(File(selectedImage!.path));
        await imageFile.save();
        announcement.set<ParseFileBase>('foto', imageFile);
      }

      announcement.objectId = widget.announcementId;

      await announcement.save();

      // Atualize os valores selecionados para que eles permaneçam após salvar
      setState(() {
        selectedCategory = announcement.get<String>('categoria') ?? '';
        selectedStatus = announcement.get<String>('status') ?? '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alterações salvas com sucesso!'),
        ),
      );
    } catch (e) {
      print('Erro ao salvar o anúncio: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar as alterações.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
