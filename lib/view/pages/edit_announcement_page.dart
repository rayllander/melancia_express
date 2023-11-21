import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_button.dart';
import 'package:melancia_express/view/components/my_editphotofield.dart';
import 'package:melancia_express/view/components/my_edittextfield.dart';


class EditAnnouncement extends StatefulWidget {
  final String announcementId;

  EditAnnouncement({Key? key, required this.announcementId}) : super(key: key);

  @override
  _EditAnnouncementState createState() => _EditAnnouncementState();
}

class _EditAnnouncementState extends State<EditAnnouncement> {
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerHarvestDate = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  DateTime? selectedDate;
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDatetime = TextEditingController();

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
    // Implemente a lógica para salvar o anúncio aqui
    // Utilize os valores dos controladores e o estado do componente
    // Pode ser necessário chamar Navigator.pop(context, true) para indicar que as alterações foram salvas
  }
}
