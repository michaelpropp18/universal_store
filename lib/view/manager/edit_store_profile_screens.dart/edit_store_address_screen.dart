import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';
import 'package:universal_store/view/manager/widgets/edit_field.dart';
import 'package:universal_store/view/manager/widgets/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditStoreAddressScreen extends StatefulWidget {
  final String originalAddress;

  const EditStoreAddressScreen(
      {this.originalAddress = '123 Northside Dr, \nAtlanta, GA 30313'});
  @override
  _EditStoreAddressScreenState createState() => _EditStoreAddressScreenState();
}

class _EditStoreAddressScreenState extends State<EditStoreAddressScreen> {
  String address;
  String errorText;

  @override
  void initState() {
    address = widget.originalAddress;
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
              SaveChangesButton(enabled: errorText == '' && address != widget.originalAddress),
            ],
          ),
        ));
  }
}
