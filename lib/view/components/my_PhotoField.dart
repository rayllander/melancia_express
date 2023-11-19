import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoField extends StatefulWidget {
  final Function(XFile? selectedImage) onImageSelected;
  final ImageProvider? selectedImageProvider;

  const PhotoField({
    Key? key,
    required this.onImageSelected,
    this.selectedImageProvider,
  }) : super(key: key);

  @override
  _PhotoFieldState createState() => _PhotoFieldState();
}

class _PhotoFieldState extends State<PhotoField> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            XFile? xFile = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );
            if (xFile != null) {
              setState(() {
                _selectedImage = xFile;
              });

              widget.onImageSelected(_selectedImage);
            }
          },
          child: Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFBEBDBD),
              ),
              color: Color(0xFFD9D9D9),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                _selectedImage != null
                    ? Image.file(
                        File(_selectedImage!.path),
                        fit: BoxFit.cover,
                      )
                    : widget.selectedImageProvider != null
                        ? Image(image: widget.selectedImageProvider!)
                        : Icon(Icons.camera_alt,
                            color: Colors.grey[600], size: 36.0),
                if (_selectedImage != null)
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                        });
                        widget.onImageSelected(null);
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Toque para escolher uma foto',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
