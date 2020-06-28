import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final dynamic onPressed;
  final String text;
  final Color backgroundColor;
  final Color fontColor;

  SubmitButton(
      {@required this.text,
      @required this.onPressed,
      this.backgroundColor: Colors.white,
      this.fontColor: Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: backgroundColor,
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            letterSpacing: 1.1,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
