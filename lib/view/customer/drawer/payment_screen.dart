import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';
import 'package:universal_store/view/manager/widgets/edit_field.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('My Payment', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 25.0,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Credit Card Information',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                EditField(
                  hintText: 'Credit Card Number',
                ),
                SizedBox(height: 10),
                EditField(
                  hintText: 'Exp. Date',
                ),
                SizedBox(height: 10),
                EditField(
                  hintText: 'CCV',
                ),
                SizedBox(height: 20),
                SubmitButton(
                    onPressed: () {
//                      if (viewModel.firstName != '' &&
//                          viewModel.lastName != '' &&
//                          viewModel.firstNameError == '' &&
//                          viewModel.lastNameError == '') {
//                        Navigator.pushNamed(
//                            context, RegisterCustomerEmailPasswordRoute);
//                      } else {
//                        viewModel.checkFirstNameError();
//                        viewModel.checkLastNameError();
//                      }
                    },
                    text: 'Save Info'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
