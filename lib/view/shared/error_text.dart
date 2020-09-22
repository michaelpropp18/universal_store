import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  ErrorText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.red),
        textAlign: TextAlign.left,
      ),
    );
  }
}