import 'package:flutter/material.dart';

class FeedbackInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Feedback'),
          RaisedButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
