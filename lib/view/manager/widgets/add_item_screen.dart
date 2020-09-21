import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';
import 'package:universal_store/view/manager/widgets/edit_field.dart';
import 'package:universal_store/view/manager/widgets/save_changes_button.dart';
import 'package:universal_store/utilities.dart' as utilities;

class AddItemScreen extends StatefulWidget {
  const AddItemScreen();

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String name;
  String nameError;
  String quantity;
  String quantityError;

  @override
  void initState() {
    name = '';
    nameError = utilities.generateItemNameError(name);
    quantity = '';
    quantityError = utilities.generateQuantityError(quantity);
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
          title: Text('Add item', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              EditField(
                error: nameError != '',
                text: name,
                hintText: 'Item name',
                onChanged: (e) {
                  setState(() {
                    name = e;
                    nameError = utilities.generateItemNameError(name);
                  });
                },
              ),
              ErrorText(nameError),
              SizedBox(height: 10),
              EditField(
                error: quantityError != '',
                text: quantity,
                hintText: 'Item Quantity',
                onChanged: (e) {
                  setState(() {
                    quantity = e;
                    quantityError = utilities.generateQuantityError(quantity);
                  });
                },
              ),
              ErrorText(quantityError),
              SaveChangesButton(enabled: nameError == '' && quantityError == ''),
            ],
          ),
        ));
  }
}
