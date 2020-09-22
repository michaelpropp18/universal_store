import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/view_models/authentication/login_view_model.dart';

class PasswordResetAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return AlertDialog(
      title: Text('Reset Password'),
      content: (viewModel.resetRequestError == '')
          ? Text(
              'An email has been sent with instructions to reset your password.')
          : Text(viewModel.resetRequestError),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
      elevation: 24.0,
    );
  }
}
