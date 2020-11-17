import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditItemBarcodeScreen extends StatefulWidget {
  final String barcode;

  const EditItemBarcodeScreen({this.barcode});
  @override
  _EditItemBarcodeScreenState createState() => _EditItemBarcodeScreenState();
}

class _EditItemBarcodeScreenState extends State<EditItemBarcodeScreen> {
  String barcode;
  String errorText;

  @override
  void initState() {
    barcode = widget.barcode.toString();
    errorText = utilities.generateBarcodeError(barcode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Edit Barcode', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            EditField(
              error: errorText != '',
              text: barcode,
              hintText: 'Item Barcode',
              onChanged: (e) {
                setState(() {
                  barcode = e;
                  errorText = utilities.generateBarcodeError(barcode);
                });
              },
            ),
            ErrorText(errorText),
            SaveChangesButton(
              onPress: () => Navigator.pop(context, int.parse(barcode)),
              enabled: errorText == '' && barcode != widget.barcode.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
