import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';

class EditItemQuantityScreen extends StatefulWidget {
  final int quantity;

  const EditItemQuantityScreen({this.quantity});
  @override
  _EditItemQuantityScreenState createState() => _EditItemQuantityScreenState();
}

class _EditItemQuantityScreenState extends State<EditItemQuantityScreen> {
  String quantity;
  String errorText;

  @override
  void initState() {
    quantity = widget.quantity.toStringAsFixed(0);
    errorText = utilities.generateQuantityError(quantity);
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
          title: Text('Edit Quantity', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: errorText != '',
                text: quantity,
                hintText: 'Quantity',
                onChanged: (e) {
                  setState(() {
                    quantity = e;
                    errorText = utilities.generateQuantityError(quantity);
                  });
                },
              ),
              ErrorText(errorText),
              SaveChangesButton(
                  onPress: () => Navigator.pop(context, int.parse(quantity)),
                  enabled: errorText == '' &&
                      quantity != widget.quantity.toString()),
            ],
          ),
        ));
  }
}
