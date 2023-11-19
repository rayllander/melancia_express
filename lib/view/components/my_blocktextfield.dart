import 'package:flutter/material.dart';

class MyBlockTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyBlockTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        readOnly: true, // Configura o campo como somente leitura
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          filled: true,
          fillColor: Color(0xFFD9D9D9),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFA9A9A9),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBEBDBD),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF757575),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          suffixIcon: Icon(Icons.lock), // Usa um ícone de cadeado no lugar do ícone de edição
        ),
      ),
    );
  }
}
