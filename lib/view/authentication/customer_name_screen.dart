import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view_models/registration_view_model.dart';

import 'widgets/back_arrow.dart';
import 'widgets/background_gradient.dart';
import 'widgets/error_text.dart';
import 'widgets/input_field.dart';
import 'widgets/submit_button.dart';

class RegisterCustomerNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          BackArrow(onSubmitted: () {
            viewModel.resetViewModel();
            Navigator.pop(context);
          }),
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
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: 'First name',
                  onChanged: (t) {
                    viewModel.firstName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.firstNameError),
                SizedBox(height: 5),
                InputField(
                  error: viewModel.lastNameError != '',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: 'Last name',
                  onChanged: (t) {
                    viewModel.lastName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.lastNameError),
                SizedBox(height: 5),
                SubmitButton(
                    onPressed: () {
                      if (viewModel.firstName != '' &&
                          viewModel.lastName != '' &&
                          viewModel.firstNameError == '' &&
                          viewModel.lastNameError == '') {
                        Navigator.pushNamed(
                            context, RegisterCustomerEmailPasswordRoute);
                      } else {
                        viewModel.checkFirstNameError();
                        viewModel.checkLastNameError();
                      }
                    },
                    text: 'Next'), //on pressed send reset email
                FlatButton(
                  onPressed: () {
                    viewModel.resetViewModel();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeRoute, (route) => false);
                  },
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
