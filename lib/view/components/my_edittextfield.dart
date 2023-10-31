import 'package:flutter/material.dart';

class MyEditTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyEditTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
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
          suffixIcon: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Adicione aqui a lógica para o que acontece quando o botão de edição é pressionado
            },
          ),
        ),
      ),
    );
  }
}
