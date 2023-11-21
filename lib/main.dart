import 'package:flutter/material.dart';
import 'package:melancia_express/view/pages/announcement_page.dart';
import 'package:melancia_express/view/pages/edit_announcement_page.dart';
import 'package:melancia_express/view/pages/filter_page.dart';
import 'package:melancia_express/view/pages/forgot_page.dart';
import 'package:melancia_express/view/pages/home_page.dart';
import 'package:melancia_express/view/pages/inicio_page.dart';
import 'package:melancia_express/view/pages/login_page.dart';
import 'package:melancia_express/view/pages/my_announcement.dart';
import 'package:melancia_express/view/pages/my_profile.dart';
import 'package:melancia_express/view/pages/profile_page.dart';
import 'package:melancia_express/view/pages/register_page.dart';
import 'package:melancia_express/view/pages/search_results_page.dart';
import 'package:melancia_express/view/theme/ligth_mode.dart';
import 'package:melancia_express/view/theme/dark_mode.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'AQL5f7yf0TkgXSzsSofkl1l12lvy4PWBKikMSEmv';
  final keyClientKey = 'OVIBKpgVEjdWiuEsOoPG1kHCtS3BSAM4K6a2SIEI';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MelanciaExpress());
}

class MelanciaExpress extends StatelessWidget {
  const MelanciaExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioPage(),
      theme: lighMode,
      darkTheme: darkMode,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgotPass': (context) => ForgotPage(),
        '/homePage': (context) => HomePage(),
        '/inicio': (context) => InicioPage(),
        '/Profile': (context) => ProfilePage(),
        '/Announcement': (context) => AnnouncementPage(),
        '/Filter': (context) => FilterPage(),
        '/MyPerfil': (context) => MyPerfil(),
        '/MyAnnouncement': (context) => MyAnnouncement(),
        '/EditAnnouncement': (context) => EditAnnouncement(announcementId: 'announcementId',),
        '/SearchResults': (context) => SearchResultsPage(
              searchResults: [],
            ),
      },
    );
  }
}
