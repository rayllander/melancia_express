import 'package:flutter/material.dart';
import 'dart:ui';

class PhotoFieldEdit extends StatefulWidget {
  final Function()? onTap;
  final String? imageUrl; // Nova propriedade para a URL da imagem

  const PhotoFieldEdit({Key? key, this.onTap, this.imageUrl}) : super(key: key);

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
          Container(
            width: double.infinity, // Oculta a altura fixa e define a largura máxima
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFBEBDBD),
              ),
              color: Color(0xFFD9D9D9),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                _isEdited
                    ? Container() // Se a imagem foi editada, não mostrar o ícone
                    : widget.imageUrl != null
                        ? Image.network(
                            widget.imageUrl!,
                            fit: BoxFit.cover, // Ajusta o fit para cobrir todo o espaço
                            width: double.infinity, // Garante que a imagem ocupe toda a largura
                          )
                        : BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              color: Colors.transparent,
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
          ),
        ],
      ),
    );
  }
}
