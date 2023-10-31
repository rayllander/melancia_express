import 'package:flutter/material.dart';
import 'dart:ui';

class PhotoFieldEdit extends StatefulWidget {
  final Function()? onTap;

  const PhotoFieldEdit({Key? key, this.onTap}) : super(key: key);

  @override
  _PhotoFieldEditState createState() => _PhotoFieldEditState();
}

class _PhotoFieldEditState extends State<PhotoFieldEdit> {
  bool _isEdited = false; // Variável para rastrear se a imagem foi editada

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEdited = true; // Quando a imagem é tocada, será marcada como editada
        });
        if (widget.onTap != null) {
          widget.onTap!(); // Se houver uma função onTap definida, ela será chamada
        }
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 120,
              height: 105,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFBEBDBD),
                ),
                color: Color(0xFFD9D9D9),
              ),
              child: _isEdited
                  ? Container() // Se a imagem foi editada, não mostrar o ícone
                  : BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
            ),
          ),
          _isEdited
              ? Container() // Se a imagem foi editada, não mostrar o ícone
              : Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFF757575), // Cor do ícone de edição
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
