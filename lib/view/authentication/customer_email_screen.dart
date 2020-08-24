import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/back_arrow.dart';
import 'package:universal_store/view/shared/loading.dart';
import 'package:universal_store/view_models/register_customer_view_model.dart';

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

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  FocusNode _confirmPasswordFocus = new FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterCustomerViewModel>(context);
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
                error: viewModel.emailError != '',
                focus: _emailFocus,
                autofocus: true,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
                onSubmitted: (t) {
                  viewModel.checkEmailError();
                  if (viewModel.emailError == '') {
                    _emailFocus.unfocus();
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  }
                },
                onChanged: (t) {
                  viewModel.email = t;
                },
                icon: Icons.email,
              ),
              ErrorText(viewModel.emailError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.passwordError != '',
                focus: _passwordFocus,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hintText: 'Password',
                obscureText: true,
                onSubmitted: (t) {
                  viewModel.checkPasswordError();
                  if (viewModel.passwordError == '') {
                    _passwordFocus.unfocus();
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                  }
                },
                onChanged: (t) {
                  viewModel.password = t;
                },
                icon: Icons.lock,
              ),
              ErrorText(viewModel.passwordError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.confirmPasswordError != '',
                focus: _confirmPasswordFocus,
                textInputType: TextInputType.text,
                hintText: 'Confirm Password',
                obscureText: true,
                onSubmitted: (t) async {
                  _confirmPasswordFocus.unfocus();
                  dynamic successful = await viewModel.createAccount();
                  if (successful) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeRoute, (route) => false);
                  }
                },
                onChanged: (t) {
                  viewModel.confirmPassword = t;
                },
                icon: Icons.lock,
              ),
              ErrorText(viewModel.confirmPasswordError),
              ErrorText(viewModel.registerError),
            ],
          ),
        ),
        if (viewModel.loading) Loading(),
      ]),
    );
  }
}
