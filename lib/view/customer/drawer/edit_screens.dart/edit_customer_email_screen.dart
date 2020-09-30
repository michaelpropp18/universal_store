import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class EditCustomerEmailScreen extends StatefulWidget {
  @override
  _EditCustomerEmailScreenState createState() =>
      _EditCustomerEmailScreenState();
}

class _EditCustomerEmailScreenState extends State<EditCustomerEmailScreen> {
  final Customer user = CurrentUser.user;

  String email;
  String errorText;

  @override
  void initState() {
    email = user.email;
    errorText = utilities.generateEmailError(email);
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
        title: Text('Edit Email', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            EditField(
              error: errorText != '',
              text: email,
              hintText: 'Email',
              onChanged: (e) {
                setState(() {
                  email = e;
                  errorText = utilities.generateEmailError(email);
                });
              },
            ),
            ErrorText(errorText),
            SaveChangesButton(
                onPress: () {
                  user.updateEmail(email);
                  Navigator.pop(context);
                },
                enabled: errorText == '' && email != user.email),
          ],
        ),
      ),
    );
  }
}
