import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class EditStoreEmailScreen extends StatefulWidget {
  @override
  _EditStoreEmailScreenState createState() => _EditStoreEmailScreenState();
}

class _EditStoreEmailScreenState extends State<EditStoreEmailScreen> {
  Manager manager = CurrentUser.user;
  String email;
  String errorText;

  @override
  void initState() {
    email = manager.email;
    errorText = utilities.generateEmailError(email);
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
                    manager.updateEmail(email);
                    Navigator.pop(context);
                  },
                  enabled: errorText == '' && email != manager.email),
            ],
          ),
        ));
  }
}
