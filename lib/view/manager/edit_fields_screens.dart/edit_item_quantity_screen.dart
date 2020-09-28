import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';

class EditItemQuantityScreen extends StatefulWidget {
  final double originalQuantity;
  final String uid;

  const EditItemQuantityScreen({this.uid, this.originalQuantity = 3});
  @override
  _EditItemQuantityScreenState createState() => _EditItemQuantityScreenState();
}

class _EditItemQuantityScreenState extends State<EditItemQuantityScreen> {
  String quantity;
  String errorText;
  String uid;

  @override
  void initState() {
    quantity = widget.originalQuantity.toStringAsFixed(0);
    errorText = utilities.generateQuantityError(quantity);
    uid = widget.uid;
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
                  onPress: updateStock,
                  enabled: errorText == '' &&
                      quantity != widget.originalQuantity.toString()),
            ],
          ),
        ));
  }

  updateStock() {
    Manager manager = CurrentUser.user;
    manager.updateItemStock(uid, int.parse(quantity));
  }
}
