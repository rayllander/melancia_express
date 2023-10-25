import 'package:flutter/material.dart';

ThemeData lighMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: const Color.fromARGB(255, 255, 255, 255),
        primary: const Color.fromARGB(255, 255, 255, 255),
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade900),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[900],
          displayColor: Colors.black,
        ));
