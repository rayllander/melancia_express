import 'package:flutter/material.dart';
import 'package:melancia_express/controllers/announcement_controller.dart';
import 'package:melancia_express/view/components/my_bottombar.dart';
import 'package:melancia_express/controllers/user_controller.dart';
import 'package:melancia_express/view/components/my_announcement_item.dart';
import 'package:melancia_express/view/pages/search_results_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final UserController userController = UserController();
  final TextEditingController searchController = TextEditingController();
  final AnnouncementController announcementController =
      AnnouncementController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goToSearchResults(BuildContext context) async {
    final searchTerm = widget.searchController.text.toLowerCase().trim();

    if (searchTerm.isNotEmpty) {
      final results =
          await widget.userController.searchUsersByNameStartingWith(searchTerm);

      if (results.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Usuário não encontrado'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsPage(
              searchResults: results,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEA3026),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
              color: Color(0x77D9D9D9),
              border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.searchController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Pesquisar por usuários',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    goToSearchResults(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<ParseObject>>(
          future: widget.announcementController.getAllAnnouncements(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar anúncios'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Nenhum anúncio encontrado'),
              );
            } else {
              List<ParseObject> announcements = snapshot.data!;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return AnnouncementItem(
                          key: ValueKey(index),
                          announcement: announcements[index],
                        );
                      },
                      childCount: announcements.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
        bottomNavigationBar: MyBottomBar(),
      ),
    );
  }
}
