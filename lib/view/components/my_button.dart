// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  void Function()? onTapButton;
  MyButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        height: 40,
        width: 270,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFF6961),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(buttonText,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
