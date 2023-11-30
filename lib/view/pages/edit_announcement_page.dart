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
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerDatetime = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  DateTime? selectedDate;
  XFile? selectedImage;
  String? imageUrl;

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

      // ignore: unnecessary_null_comparison
      if (announcementToEdit != null) {
        setState(() {
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
                imageUrl:
                    imageUrl, // Passe a URL da imagem para o PhotoFieldEdit
              ),
              SizedBox(height: 20),
              MyEditTextField(
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
              MyEditTextField(
                hintText: 'Status',
                obscureText: false,
                controller: controllerStatus,
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

      announcement.set('categoria', controllerCategory.text);
      DateTime formattedDate =
          DateFormat('dd/MM/yyyy').parse(controllerDatetime.text);
      announcement.set<DateTime>('data_colheita', formattedDate);
      announcement.set('status', controllerStatus.text);
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alterações salvas com sucesso!'),
        ),
      );

      // Se você quiser permanecer na mesma página sem navegar de volta
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
