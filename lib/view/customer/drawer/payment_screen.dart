import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/input_field.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Text('Payment'),
          RaisedButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 85.0,
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
                InputField(
                  error: false,
                  icon: Icons.credit_card,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: 'Credit Card Number',
                  onChanged: (t) {
                    //viewModel.firstName = t;
                  },
                ),
                SizedBox(height: 10),
                InputField(
                  error: false,
                  icon: Icons.date_range,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: 'Exp. Date',
                  onChanged: (t) {
                    //viewModel.lastName = t;
                  },
                ),
                SizedBox(height: 10),
                InputField(
                  error: false,
                  icon: Icons.enhanced_encryption,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: 'CCV',
                  onChanged: (t) {
                    //viewModel.firstName = t;
                  },
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
