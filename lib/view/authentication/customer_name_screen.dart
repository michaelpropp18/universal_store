import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view_models/register_customer_view_model.dart';

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

  @override
  void dispose() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterCustomerViewModel>(context);
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
                  error: viewModel.firstNameError != '',
                  focus: _firstNameFocus,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hintText: 'First name',
                  onSubmitted: (t) {
                    viewModel.checkFirstNameError();
                    if (viewModel.firstNameError == '') {
                      _firstNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_lastNameFocus);
                    }
                  },
                  onChanged: (t) {
                    viewModel.firstName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.firstNameError),
                SizedBox(height: 5),
                InputField(
                  error: viewModel.lastNameError != '',
                  focus: _lastNameFocus,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'Last name',
                  onSubmitted: (t) {
                    viewModel.checkLastNameError();
                    if (viewModel.firstNameError == '' &&
                        viewModel.lastNameError == '') {
                      Navigator.pushNamed(
                          context, RegisterCustomerEmailPasswordRoute);
                    }
                  },
                  onChanged: (t) {
                    viewModel.lastName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.lastNameError),
                FlatButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, HomeRoute, (route) => false),
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
