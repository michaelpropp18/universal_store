import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class EditStoreWebsiteScreen extends StatefulWidget {
  @override
  _EditStoreWebsiteScreenState createState() => _EditStoreWebsiteScreenState();
}

class _EditStoreWebsiteScreenState extends State<EditStoreWebsiteScreen> {
  Manager manager = CurrentUser.user;
  String website;
  String errorText;

  @override
  void initState() {
    website = manager.storeWebsite;
    errorText = utilities.generateWebsiteError(website);
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
          title: Text('Edit Website', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: errorText != '',
                text: website,
                hintText: 'Website',
                onChanged: (e) {
                  setState(() {
                    website = e;
                    errorText = utilities.generateWebsiteError(website);
                  });
                },
              ),
              ErrorText(errorText),
              SaveChangesButton(
                  onPress: () {
                    manager.updateStoreWebsite(website);
                    Navigator.pop(context);
                  },
                  enabled: errorText == '' && website != manager.storeWebsite),
            ],
          ),
        ));
  }
}
