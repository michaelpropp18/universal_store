import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

import 'widgets/back_arrow.dart';
import 'widgets/background_gradient.dart';
import 'widgets/error_text.dart';
import 'widgets/input_field.dart';

class RegisterCustomerNameScreen extends StatefulWidget {
  @override
  _RegisterCustomerNameScreenState createState() =>
      _RegisterCustomerNameScreenState();
}

class _RegisterCustomerNameScreenState
    extends State<RegisterCustomerNameScreen> {
  FocusNode _firstNameFocus = new FocusNode();
  FocusNode _lastNameFocus = new FocusNode();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();

  // text field states
  String firstNameError = '';
  String lastNameError = '';

  void checkFirstNameError() {
    setState(() {
      if (firstNameTextController.text == '') {
        firstNameError = 'First name cannot be empty';
      } else {
        firstNameError = '';
      }
    });
  }

  void checkLastNameError() {
    setState(() {
      if (lastNameTextController.text == '') {
        lastNameError = 'Last name cannot be empty';
      } else {
        lastNameError = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _firstNameFocus.addListener(() {
      if (!_firstNameFocus.hasFocus) {
        checkFirstNameError();
      }
    });
    _lastNameFocus.addListener(() {
      if (!_lastNameFocus.hasFocus) {
        checkLastNameError();
      }
    });
  }

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          BackArrow(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 85.0,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'What is your name?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                InputField(
                  error: firstNameError != '',
                  textController: firstNameTextController,
                  focus: _firstNameFocus,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hintText: 'First name',
                  onSubmitted: (t) {
                    checkFirstNameError();
                    if (firstNameError == '') {
                      _firstNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_lastNameFocus);
                    }
                  },
                  icon: Icons.person,
                ),
                ErrorText(firstNameError),
                SizedBox(height: 5),
                InputField(
                  error: lastNameError != '',
                  textController: lastNameTextController,
                  focus: _lastNameFocus,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'Last name',
                  onSubmitted: (t) {
                    checkLastNameError();
                    if (firstNameError == '' && lastNameError == '') {
                      Navigator.pushNamed(
                          context, RegisterCustomerEmailPasswordRoute);
                    }
                  },
                  icon: Icons.person,
                ),
                ErrorText(lastNameError),
                FlatButton(
                  onPressed: () => Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName)),
                  child: Text(
                    'Already have an account?',
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
