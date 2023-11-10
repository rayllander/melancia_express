import 'package:flutter/material.dart';

class PhotoField extends StatelessWidget {
  final Function()? onTap;

  const PhotoField({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
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
                child: Padding(
                  padding: const EdgeInsets.all(100.0), // Ajuste o valor do padding interno conforme desejado
                  child: Icon(Icons.camera_alt, color: Colors.grey[600]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
