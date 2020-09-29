import 'package:flutter/material.dart';

class ViewProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('View Product', style: TextStyle(color: Colors.black)),
      ),
      body: Container(),
    );
  }
}
