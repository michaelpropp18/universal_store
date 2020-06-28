import 'package:flutter/material.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/view/authentication/widgets/header_text.dart';

import 'widgets/background_gradient.dart';
import 'widgets/bottom_button.dart';
import 'widgets/error_text.dart';
import 'widgets/input_field.dart';
import 'widgets/submit_button.dart';

class CustomerFields extends StatefulWidget {
  @override
  _CustomerFieldsState createState() => _CustomerFieldsState();
}

class _CustomerFieldsState extends State<CustomerFields> {
  final AuthService _auth = AuthService();

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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 50.0,
            ),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.person_pin,
                  size: 150,
                  color: Colors.white,
                ),
                Text(
                  'What\'s your name?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                InputField(
                  error: firstNameError != '',
                  textController: firstNameTextController,
                  focus: _firstNameFocus,
                  textInputType: TextInputType.text,
                  hintText: 'First name',
                  icon: Icons.person,
                ),
                ErrorText(firstNameError),
                SizedBox(height: 5),
                InputField(
                  error: lastNameError != '',
                  textController: lastNameTextController,
                  focus: _lastNameFocus,
                  textInputType: TextInputType.text,
                  hintText: 'Last name',
                  icon: Icons.person,
                ),
                ErrorText(lastNameError),
                SizedBox(height: 5),
                Spacer(),
                SubmitButton(onPressed: () {}, text: 'Continue'),
                Spacer(),
                BottomButton(
                    text: 'Back', onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
