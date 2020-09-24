import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view_models/login_view_model.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          viewModel.resetViewModel();
          Navigator.pushReplacementNamed(context, ForgotPasswordRoute);
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
