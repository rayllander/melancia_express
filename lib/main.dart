import 'package:flutter/material.dart';
import 'package:melancia_express/view/pages/forgot_page.dart';
import 'package:melancia_express/view/pages/home_page.dart';
import 'package:melancia_express/view/pages/inicio_page.dart';
import 'package:melancia_express/view/pages/login_page.dart';
import 'package:melancia_express/view/pages/register_page.dart';
import 'package:melancia_express/view/theme/dark_mode.dart';
import 'package:melancia_express/view/theme/ligth_mode.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: inicioPage(),
      theme: lighMode,
      darkTheme: darkMode,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgotPass': (context) => ForgotPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
