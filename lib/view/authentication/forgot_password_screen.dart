import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/background_gradient.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/view/shared/error_text.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';
import 'package:universal_store/view/shared/loading.dart';
import 'package:universal_store/view_models/login_view_model.dart';

import 'widgets/back_arrow.dart';
import 'widgets/background_gradient.dart';
import 'widgets/input_field.dart';
import 'widgets/password_reset_alert.dart';

class ForgotPasswordScreen extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return PasswordResetAlert();
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
          BackArrow(onSubmitted: () {
            viewModel.resetViewModel();
            Navigator.pushReplacementNamed(context, HomeRoute);
          }),
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
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                InputField(
                  error: viewModel.resetEmailError != '',
                  autofocus: true,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  onChanged: (t) {
                    viewModel.resetEmail = t;
                  },
                  icon: Icons.mail,
                ),
                ErrorText(viewModel.resetEmailError),
                SizedBox(height: 24),
                SubmitButton(
                    onPressed: () async {
                      if (viewModel.resetEmail != '' &&
                          viewModel.resetEmailError == '') {
                        await viewModel.resetPassword();
                        createAlertDialog(context);
                      } else {
                        viewModel.checkResetEmailError();
                      }
                    },
                    text: 'Send Reset Email'), //on pressed send reset email
                SizedBox(height: 20),
              ],
            ),
          ),
          if (viewModel.loading) Loading(),
        ],
      ),
    );
  }
}
