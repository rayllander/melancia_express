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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFBEBDBD),
                  ),
                  color: Color(0xFFD9D9D9),
                ),
                child: _selectedImage != null
                    ? Image.file(
                        File(_selectedImage!.path),
                        fit: BoxFit.cover,
                      )
                    : widget.selectedImageProvider != null
                        ? Image(image: widget.selectedImageProvider!)
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0),
                            child: Icon(Icons.camera_alt,
                                color: Colors.grey[600], size: 36.0),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
