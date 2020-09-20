import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/background_gradient.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';
import 'package:universal_store/view/shared/loading.dart';
import 'package:universal_store/view_models/authentication/login_view_model.dart';

import 'widgets/bottom_button.dart';
import 'widgets/error_text.dart';
import 'widgets/header_text.dart';
import 'widgets/input_field.dart';
import 'widgets/forgot_password_button.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 50.0,
            ),
            child: Column(
              children: <Widget>[
                HeaderText('Universal\nStore'),
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
                  error: viewModel.emailError != '',
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  icon: Icons.email,
                  onChanged: (t) {
                    viewModel.email = t;
                  },
                ),
                ErrorText(viewModel.emailError),
                SizedBox(height: 5),
                InputField(
                  error: viewModel.passwordError != '',
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (t) {
                    viewModel.password = t;
                  },
                ),
                ErrorText(viewModel.passwordError),
                ForgotPasswordButton(),
                Spacer(),
                SubmitButton(onPressed: viewModel.signIn, text: 'Sign In'),
                SizedBox(height: 5),
                ErrorText(viewModel.loginError),
                Spacer(),
                Text('Not a member?', style: TextStyle(color: Colors.white)),
                BottomButton(
                    text: 'Create Account',
                    onPressed: () {
                      viewModel.resetViewModel();
                      Navigator.pushReplacementNamed(context, RegisterTypeRoute);
                    }),
              ],
            ),
          ),
          if (viewModel.loading) Loading(),
        ],
      ),
    );
  }
}
