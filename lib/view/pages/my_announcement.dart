import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_banner.dart';
import 'package:melancia_express/view/pages/edit_announcement_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyAnnouncement extends StatefulWidget {
  MyAnnouncement({Key? key}) : super(key: key);

  @override
  _MyAnnouncementState createState() => _MyAnnouncementState();
}

class _MyAnnouncementState extends State<MyAnnouncement> {
  final AnnouncementController _announcementController = AnnouncementController();
  List<ParseObject> _userAnnouncements = [];

  @override
  void initState() {
    super.initState();
    _loadUserAnnouncements();
  }

  Future<void> _loadUserAnnouncements() async {
    try {
      var announcements = await _announcementController.getUserAnnouncements();
      setState(() {
        _userAnnouncements = announcements;
      });
    } catch (e) {
      print('Erro ao carregar os anúncios do usuário: $e');
    }
  }

  Future<void> _deleteAnnouncement(String announcementId) async {
    final success = await _announcementController.deleteAnnouncement(announcementId);
    if (success) {
      _loadUserAnnouncements();
    } else {
      print('Erro ao excluir o anúncio.');
    }
  }

  Future<void> _navigateToEditAnnouncement(String announcementId) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditAnnouncement(announcementId: announcementId)),
    );

    // Atualize a lista apenas se a tela de edição retornar algum resultado,
    // por exemplo, se o usuário salvar as alterações
    if (result != null) {
      _loadUserAnnouncements();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'MEUS ANÚNCIOS'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _userAnnouncements.map((announcement) {
            final announcementId = announcement.objectId as String;
            final imageUrl = announcement['foto']?.url ?? '';
            return Column(
              children: [
                MyBanner(
                  key: Key(announcementId),
                  imageUrl: imageUrl,
                  onEdit: () {
                    _navigateToEditAnnouncement(announcementId);
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Excluir Anúncio'),
                          content: Text('Deseja realmente excluir este anúncio?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _deleteAnnouncement(announcementId);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Excluir',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
