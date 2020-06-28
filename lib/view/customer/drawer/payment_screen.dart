import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Payment'),
          RaisedButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
