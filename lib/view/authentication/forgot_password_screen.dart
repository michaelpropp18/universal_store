
import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/background_gradient.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';
import 'package:universal_store/view_models/login_view_model.dart';

import 'widgets/background_gradient.dart';

class ForgotPasswordScreen extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Email Sent"),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 80.0,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter email address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                ),
                SizedBox(height: 15),
                SubmitButton(
                  onPressed: () {
                    createAlertDialog(context);
                  },
                    text: 'Send Reset Email'), //on pressed send reset email
                SizedBox(height: 20),
                FlatButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, HomeRoute, (route) => false),
                  child: Text(
                    'Return to login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
