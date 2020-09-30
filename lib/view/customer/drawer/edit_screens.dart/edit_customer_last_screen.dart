import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class EditCustomerLastScreen extends StatefulWidget {
  @override
  _EditCustomerLastScreenState createState() => _EditCustomerLastScreenState();
}

class _EditCustomerLastScreenState extends State<EditCustomerLastScreen> {
  final Customer user = CurrentUser.user;

  String lastName;
  String errorText;

  @override
  void initState() {
    lastName = user.lastName;
    errorText = utilities.generateNameError(lastName);
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
        title: Text('Edit Last Name', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            EditField(
              error: errorText != '',
              text: lastName,
              hintText: 'Last Name',
              onChanged: (e) {
                setState(() {
                  lastName = e;
                  errorText = utilities.generateNameError(lastName);
                });
              },
            ),
            ErrorText(errorText),
            SaveChangesButton(
                onPress: () {
                  user.updateLastName(lastName);
                  Navigator.pop(context);
                },
                enabled: errorText == '' && lastName != user.lastName),
          ],
        ),
      ),
    );
  }
}
