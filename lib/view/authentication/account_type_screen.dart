import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/bottom_button.dart';
import 'package:universal_store/view/authentication/widgets/forgot_password_button.dart';

import 'widgets/background_gradient.dart';
import 'widgets/header_text.dart';
import 'widgets/submit_button.dart';

class AccountType extends StatefulWidget {
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 50.0,
            ),
            child: Column(
              children: <Widget>[
                HeaderText('Create Your Account'),
                Spacer(flex: 1),
                Text(
                  'I am a ...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                SubmitButton(
                  backgroundColor: Colors.green,
                  fontColor: Colors.white,
                  text: 'Customer',
                  onPressed: () =>
                      Navigator.pushNamed(context, RegisterCustomerRoute),
                ),
                SizedBox(height: 30),
                SubmitButton(
                  backgroundColor: Colors.pink,
                  fontColor: Colors.white,
                  text: 'Store Manager',
                  onPressed: () =>
                      Navigator.pushNamed(context, RegisterManagerRoute),
                ),
                SizedBox(height: 15),
                Spacer(flex: 2),
                Text('Already a member?',
                    style: TextStyle(color: Colors.white)),
                BottomButton(
                  text: 'Sign in to account',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeRoute);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
    return scaffold;
  }
}
