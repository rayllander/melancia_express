// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTapButton;
  final bool isDisabled;
  MyButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTapButton,
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey : Color(0xFFEA3026),
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
