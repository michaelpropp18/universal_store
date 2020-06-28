import 'package:flutter/material.dart';

import 'widgets/bottom_button.dart';

class ManagerFields extends StatefulWidget {
  @override
  _ManagerFieldsState createState() => _ManagerFieldsState();
}

class _ManagerFieldsState extends State<ManagerFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomButton(
            text: 'Back', onPressed: () => Navigator.pop(context)));
  }
}
