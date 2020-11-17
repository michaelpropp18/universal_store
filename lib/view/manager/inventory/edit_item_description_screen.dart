import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/shared/edit_field.dart';
import 'package:universal_store/view/shared/save_changes_button.dart';

import 'package:universal_store/utilities.dart' as utilities;

class EditItemDescriptionScreen extends StatefulWidget {
  final String description;

  const EditItemDescriptionScreen({this.description});
  @override
  _EditItemDescriptionScreenState createState() => _EditItemDescriptionScreenState();
}

class _EditItemDescriptionScreenState extends State<EditItemDescriptionScreen> {
  String description;
  String errorText;

  @override
  void initState() {
    description = widget.description.toString();
    errorText = utilities.generateDescriptionError(description);
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
        title: Text('Edit Description', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            EditField(
              error: errorText != '',
              text: description,
              hintText: 'Item Description',
              onChanged: (e) {
                setState(() {
                  description = e;
                  errorText = utilities.generateDescriptionError(description);
                });
              },
            ),
            ErrorText(errorText),
            SaveChangesButton(
              onPress: () => Navigator.pop(context, description),
              enabled: errorText == '' && description != widget.description,
            ),
          ],
        ),
      ),
    );
  }
}
