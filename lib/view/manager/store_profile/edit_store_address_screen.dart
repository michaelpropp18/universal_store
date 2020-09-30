import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/models/current_user.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditStoreAddressScreen extends StatefulWidget {
  @override
  _EditStoreAddressScreenState createState() => _EditStoreAddressScreenState();
}

class _EditStoreAddressScreenState extends State<EditStoreAddressScreen> {
  Manager manager = CurrentUser.user;
  String address;
  String errorText;

  @override
  void initState() {
    address = manager.storeAddress;
    errorText = utilities.generateAddressError(address);
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
          title: Text('Edit Address', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: errorText != '',
                text: address,
                hintText: 'Address',
                maxLines: 5,
                onChanged: (e) {
                  setState(() {
                    address = e;
                    errorText = utilities.generateAddressError(address);
                  });
                },
              ),
              ErrorText(errorText),
              SaveChangesButton(
                  onPress: () {
                    manager.updateStoreAddress(address);
                    Navigator.pop(context);
                  },
                  enabled: errorText == '' && address != manager.storeAddress),
            ],
          ),
        ));
  }
}
