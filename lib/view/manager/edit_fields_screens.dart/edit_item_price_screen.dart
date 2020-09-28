import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditItemPriceScreen extends StatefulWidget {
  final double originalPrice;
  final String uid;

  const EditItemPriceScreen({this.uid, this.originalPrice});
  @override
  _EditItemPriceScreenState createState() => _EditItemPriceScreenState();
}

class _EditItemPriceScreenState extends State<EditItemPriceScreen> {
  String price;
  String errorText;
  String uid;

  @override
  void initState() {
    price = widget.originalPrice.toString();
    errorText = utilities.generatePriceError(price);
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
          title: Text('Edit Price', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: errorText != '',
                text: price,
                hintText: 'Price',
                onChanged: (e) {
                  setState(() {
                    price = e;
                    errorText = utilities.generatePriceError(price);
                  });
                },
              ),
              ErrorText(errorText),
              SaveChangesButton(
                  onPress: updatePrice,
                  enabled: errorText == '' &&
                      price != widget.originalPrice.toString()),
            ],
          ),
        ));
  }

  updatePrice() {
    Manager manager = CurrentUser.user;
    manager.updateItemPrice(uid, double.parse(price));
  }
}
