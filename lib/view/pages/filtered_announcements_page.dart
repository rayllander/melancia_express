import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/view/components/my_announcement_item.dart';
import 'package:melancia_express/view/components/my_appbar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FilteredAnnouncementsPage extends StatefulWidget {
  @override
  _FilteredAnnouncementsPageState createState() =>
      _FilteredAnnouncementsPageState();
}

class _FilteredAnnouncementsPageState extends State<FilteredAnnouncementsPage> {
  final AnnouncementController announcementController =
      AnnouncementController();
  String categoria = '';
  String status = '';
  List<ParseObject> filteredAnnouncements = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    categoria = 'CategoriaFiltro';
    status = 'StatusFiltro';

    loadFilteredAnnouncements();
  }

  Future<void> loadFilteredAnnouncements() async {
    try {
      String categoriaFiltro = categoria;
      String statusFiltro = status;

      filteredAnnouncements = await announcementController
          .getFilteredAnnouncements(categoriaFiltro, statusFiltro);

      errorMessage = '';
    } catch (e) {
      print('Erro ao obter os anúncios filtrados: $e');

      errorMessage =
          'Erro ao carregar os anúncios. Por favor, tente novamente mais tarde.';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'ANÚNCIOS FILTRADOS:'),
      body: errorMessage.isNotEmpty
          ? Center(
              child: Text(errorMessage),
            )
          : filteredAnnouncements.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return AnnouncementItem(
                            key: ValueKey(index),
                            announcement: filteredAnnouncements[index],
                          );
                        },
                        childCount: filteredAnnouncements.length,
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
