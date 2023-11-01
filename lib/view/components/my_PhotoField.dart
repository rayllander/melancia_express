import 'package:flutter/material.dart';

class PhotoField extends StatelessWidget {
  final Function()? onTap;

  const PhotoField({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5), // Valor para a borda arredondada
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFBEBDBD), // Cor da borda semelhante ao TextField
            ),
            color: Color(0xFFD9D9D9), // Cor de preenchimento
          ),
          child: Icon(Icons.camera_alt, size: 60, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
