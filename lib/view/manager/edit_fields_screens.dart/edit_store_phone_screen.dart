import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditStorePhoneScreen extends StatefulWidget {
  final String originalPhone;

  const EditStorePhoneScreen({this.originalPhone = '(404) 444-4444'});
  @override
  _EditStorePhoneScreenState createState() => _EditStorePhoneScreenState();
}

class _EditStorePhoneScreenState extends State<EditStorePhoneScreen> {
  String phone;
  String errorText;

  @override
  void initState() {
    phone = widget.originalPhone;
    errorText = utilities.generatePhoneError(phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final viewModel = Provider.of<StoreProfileViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Edit Phone', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: errorText != '',
                text: phone,
                hintText: 'Phone number',
                onChanged: (e) {
                  setState(() {
                    phone = e;
                    errorText = utilities.generatePhoneError(phone);
                  });
                },
              ),
              ErrorText(errorText),
              SaveChangesButton(enabled: errorText == '' && phone != widget.originalPhone),
            ],
          ),
        ));
  }
}
