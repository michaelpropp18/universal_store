import 'package:flutter/material.dart';

class StoreOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('My Orders', style: TextStyle(color: Colors.black)),
      ),
      body: Container(),
    );
  }
}