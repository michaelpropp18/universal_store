import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/back_arrow.dart';
import 'package:universal_store/view/shared/loading.dart';
import 'package:universal_store/view_models/authentication/registration_view_model.dart';

import 'widgets/background_gradient.dart';
import '../shared/error_text.dart';
import 'widgets/input_field.dart';
import 'widgets/submit_button.dart';

class RegisterCustomerEmailPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        BackgroundGradient(),
        BackArrow(onSubmitted: () {
          viewModel.resetCustomerEmailPassword();
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
                'Let\'s get you set up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              InputField(
                error: viewModel.emailError != '',
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
                onChanged: (t) {
                  viewModel.email = t;
                },
                icon: Icons.email,
              ),
              ErrorText(viewModel.emailError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.passwordError != '',
                textInputType: TextInputType.text,
                hintText: 'Password',
                obscureText: true,
                onChanged: (t) {
                  viewModel.password = t;
                },
                icon: Icons.lock,
              ),
              ErrorText(viewModel.passwordError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.confirmPasswordError != '',
                textInputType: TextInputType.text,
                hintText: 'Confirm Password',
                obscureText: true,
                onChanged: (t) {
                  viewModel.confirmPassword = t;
                },
                icon: Icons.lock,
              ),
              SizedBox(height: 5),
              ErrorText(viewModel.confirmPasswordError),
              SizedBox(height: 10),
              SubmitButton(
                  onPressed: () async {
                    if (await viewModel.createCustomerAccount()) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeRoute, (route) => false);
                    }
                  },
                  text: 'Create Account'),
              ErrorText(viewModel.registerError),
            ],
          ),
        ),
        if (viewModel.loading) Loading(),
      ]),
    );
  }
}
