import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  MyBanner({
    Key? key,
    required this.imageUrl,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border.all(color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300.0, // Defina a altura desejada para o contêiner
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity, // Ocupar a largura total do contêiner
                      height: double.infinity, // Ocupar a altura total do contêiner
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Espaço entre os banners
        ],
      ),
    );
  }
}
