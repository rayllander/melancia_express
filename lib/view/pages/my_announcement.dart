import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:melancia_express/view/components/my_banner.dart';
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
                    // Implemente a lógica de edição
                  },
                  onDelete: () {
                    // Implemente a lógica de exclusão
                  },
                ),
                SizedBox(height: 20), // Espaço entre os banners
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
