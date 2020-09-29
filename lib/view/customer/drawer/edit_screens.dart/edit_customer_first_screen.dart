import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class EditCustomerFirstScreen extends StatefulWidget {
  @override
  _EditCustomerFirstScreenState createState() =>
      _EditCustomerFirstScreenState();
}

class _EditCustomerFirstScreenState extends State<EditCustomerFirstScreen> {
  final Customer user = CurrentUser.user;

  String firstName;
  String errorText;

  @override
  void initState() {
    firstName = user.firstName;
    errorText = utilities.generateNameError(firstName);
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
        title: Text('Edit First Name', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            EditField(
              error: errorText != '',
              text: firstName,
              hintText: 'First Name',
              onChanged: (e) {
                setState(() {
                  firstName = e;
                  errorText = utilities.generateNameError(firstName);
                });
              },
            ),
            ErrorText(errorText),
            SaveChangesButton(
                onPress: () => user.updateFirstName(firstName),
                enabled: errorText == '' && firstName != user.firstName),
          ],
        ),
      ),
    );
  }
}
