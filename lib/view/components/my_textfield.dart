import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 270,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBEBDBD),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF757575),
            ),
          ),
          fillColor: Color(0xFFD9D9D9),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFA9A9A9),
          ),
        ),
      ),
    );
  }
}
