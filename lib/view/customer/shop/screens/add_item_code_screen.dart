import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

class AddItemCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Enter Code', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Text('Instructions of where to find the code on the barcode'),
          SizedBox(
            height: 20,
          ),
          Text('input barcode'),
          TextField(),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('Add item'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, ShoppingCartRoute);
            },
          ),
        ],
      ),
    );
  }
}
