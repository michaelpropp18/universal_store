import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
