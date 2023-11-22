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
              announcementToEdit.get<DateTime>('data_colheita') ?? DateTime.now());
          controllerStatus.text = announcementToEdit.get('status') ?? '';
          controllerValue.text = announcementToEdit.get<double>('preco')?.toString() ?? '';
          controllerTelephone.text = announcementToEdit.get<int>('telefone')?.toString() ?? '';
          controllerEmail.text = announcementToEdit.get('email') ?? '';

          var foto = announcementToEdit.get<ParseFileBase>('foto');
          if (foto != null) {

          }
        });
      } else {

        print('Anúncio não encontrado');
      }
    } catch (e) {
      // Handle errors
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

  void _saveAnnouncement() {
  }
}
