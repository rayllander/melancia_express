import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35.0);
}
