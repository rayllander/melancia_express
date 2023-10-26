import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  //void Function(int)? onTabChange;
  //MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFFEA3026),
        color: Colors.white,
        activeColor: Colors.white,
        tabs: [
          GButton(
            icon: IconData(0xf521, fontFamily: 'MaterialIcons'),
            iconSize: 24,
          ),
          GButton(
            icon: IconData(0xf529, fontFamily: 'MaterialIcons'),
            iconSize: 24,
          ),
          GButton(
            icon: IconData(0xe27a, fontFamily: 'MaterialIcons'),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
