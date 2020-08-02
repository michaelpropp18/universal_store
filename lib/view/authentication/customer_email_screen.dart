import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/view/authentication/widgets/back_arrow.dart';

import 'widgets/background_gradient.dart';
import 'widgets/error_text.dart';
import 'widgets/input_field.dart';

class RegisterCustomerEmailPasswordScreen extends StatefulWidget {
  @override
  _RegisterCustomerEmailPasswordScreenState createState() =>
      _RegisterCustomerEmailPasswordScreenState();
}

class _RegisterCustomerEmailPasswordScreenState
    extends State<RegisterCustomerEmailPasswordScreen> {
  final AuthService _auth = AuthService();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  FocusNode _confirmPasswordFocus = new FocusNode();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  void checkEmailError() {
    setState(() {
      if (emailTextController.text == '') {
        emailError = 'Email cannot be empty';
      } else {
        emailError = '';
      }
    });
  }

  void checkPasswordError() {
    setState(() {
      if (passwordTextController.text == '') {
        passwordError = 'Password cannot be empty';
      } else {
        passwordError = '';
      }
    });
  }

  void checkConfirmPasswordError() {
    setState(() {
      if (confirmPasswordTextController.text == '') {
        confirmPasswordError = 'Password cannot be empty';
      } else {
        confirmPasswordError = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus) {
        checkEmailError();
      }
    });
    _passwordFocus.addListener(() {
      if (!_passwordFocus.hasFocus) {
        checkPasswordError();
      }
    });
    _confirmPasswordFocus.addListener(() {
      if (!_confirmPasswordFocus.hasFocus) {
        checkConfirmPasswordError();
      }
    });
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
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
                'Let\'s get you set up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              InputField(
                error: emailError != '',
                textController: emailTextController,
                focus: _emailFocus,
                autofocus: true,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
                onSubmitted: (t) {
                  checkEmailError();
                  if (emailError == '') {
                    _emailFocus.unfocus();
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  }
                },
                icon: Icons.email,
              ),
              ErrorText(emailError),
              SizedBox(height: 5),
              InputField(
                error: passwordError != '',
                textController: passwordTextController,
                focus: _passwordFocus,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hintText: 'Password',
                obscureText: true,
                onSubmitted: (t) {
                  checkPasswordError();
                  if (passwordError == '') {
                    _passwordFocus.unfocus();
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                  }
                },
                icon: Icons.lock,
              ),
              ErrorText(passwordError),
              SizedBox(height: 5),
              InputField(
                error: confirmPasswordError != '',
                textController: confirmPasswordTextController,
                focus: _confirmPasswordFocus,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hintText: 'Confirm Password',
                obscureText: true,
                onSubmitted: (t) {
                  checkConfirmPasswordError();
                  if (emailError == '' &&
                      passwordError == '' &&
                      confirmPasswordError == '') {
                    dynamic result = _auth.registerWithEmailAndPassword(
                        emailTextController.text, passwordTextController.text);
                    if (result == null) {
                      print('oof, an error occurred');
                    } else {
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName));
                    }
                  }
                },
                icon: Icons.lock,
              ),
              ErrorText(confirmPasswordError),
            ],
          ),
        )
      ]),
    );
  }
}
