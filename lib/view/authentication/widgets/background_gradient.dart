import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          //colors: [Colors.blue, Color.fromRGBO(70, 0, 130, 1)],
          colors: [Colors.blue, Colors.indigo[900]],
          //colors: [Colors.indigo[400], Colors.blue[900]],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
    );
  }
}