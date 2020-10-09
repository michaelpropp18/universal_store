import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

class AddItemCodeScreen extends StatefulWidget {
  @override
  _AddItemCodeScreenState createState() => _AddItemCodeScreenState();
}

class _AddItemCodeScreenState extends State<AddItemCodeScreen> {
  Manager store;
  String number;
  String errorText;

  @override
  void initState() {
    number = '';
    errorText = utilities.generateBarcodeError(number);
    super.initState();
  }

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
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            Image.asset(
              'assets/barcode_example.png',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter all visible numbers on the bottom of the barcode.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            EditField(
              hintText: '01234567895',
              onChanged: (e) {
                setState(() {
                  number = e;
                  errorText = utilities.generateBarcodeError(number);
                });
              },
            ),
            SaveChangesButton(
                enabled: errorText == '',
                onPress: () => Navigator.pushReplacementNamed(
                    context, ShoppingCartRoute,
                    arguments: store),
                text: 'Add Item'),
          ],
        ),
      ),
    );
  }
}
