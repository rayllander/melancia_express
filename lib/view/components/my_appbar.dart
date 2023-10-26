import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 191, 41, 41),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35.0);
}
