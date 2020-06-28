import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/services/auth_exception_handler.dart';
import 'package:universal_store/view/authentication/widgets/background_gradient.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';

import '../../services/auth.dart';
import 'widgets/bottom_button.dart';
import 'widgets/error_text.dart';
import 'widgets/header_text.dart';
import 'widgets/input_field.dart';
import 'widgets/forgot_password_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // text field states
  String emailError = '';
  String passwordError = '';
  String loginError = '';

  void checkEmailError() {
    setState(() {
      if (emailTextController.text == '') {
        emailError = 'Email field cannot be empty';
      } else if (!emailTextController.text.contains('@')) {
        emailError = 'Please enter a valid email';
      } else {
        emailError = '';
      }
    });
  }

  void checkPasswordError() {
    setState(() {
      if (passwordTextController.text == '') {
        passwordError = 'Password field cannot be empty';
      } else {
        passwordError = '';
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
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future signIn() async {
    if (emailTextController.text != '' &&
        passwordTextController.text != '' &&
        emailError == '' &&
        passwordError == '') {
      dynamic status = await _auth.signInWithEmailAndPassword(
          emailTextController.text, passwordTextController.text);
      if (status != AuthResultStatus.successful) {
        setState(() =>
            loginError = AuthExceptionHandler.generateExceptionMessage(status));
      }
    } else {
      checkEmailError();
      checkPasswordError();
    }
  }

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
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
                HeaderText('Universal Store'),
                Spacer(),
                Text(
                  'Member Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                InputField(
                  error: emailError != '',
                  textController: emailTextController,
                  focus: _emailFocus,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                ErrorText(emailError),
                SizedBox(height: 5),
                InputField(
                  error: passwordError != '',
                  textController: passwordTextController,
                  focus: _passwordFocus,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                ErrorText(passwordError),
                ForgotPasswordButton(),
                Spacer(),
                SubmitButton(onPressed: signIn, text: 'Sign In'),
                SizedBox(height: 5),
                ErrorText(loginError),
                Spacer(),
                Text('Not a member?', style: TextStyle(color: Colors.white)),
                BottomButton(
                    text: 'Create Account',
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, RegisterTypeRoute)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
