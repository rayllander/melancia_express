import 'package:flutter/material.dart';

void displayMessage(String message, BuildContext context,
    {required Null Function() onButtonPressed, required String buttonText}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}

void loadingCircle(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
