import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view_models/update_profile_view_model.dart';

import 'package:universal_store/view/authentication/widgets/back_arrow.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';
import 'package:universal_store/view/authentication/widgets/input_field.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UpdateProfileViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
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
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'First Name: ' + viewModel.currentFirstName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                InputField(
                  error: viewModel.firstNameError != '',
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: viewModel.firstName,
                  onChanged: (t) {
                    viewModel.firstName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.firstNameError),
                Text(
                  'Last Name: ' + viewModel.currentLastName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                InputField(
                  error: viewModel.lastNameError != '',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: viewModel.lastName,
                  onChanged: (t) {
                    viewModel.lastName = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.lastNameError),
                SizedBox(height: 5),
                Text(
                  'Email Address: ' + viewModel.currentEmail,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                InputField(
                  error: viewModel.emailError != '',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: viewModel.email,
                  onChanged: (t) {
                    viewModel.email = t;
                  },
                  icon: Icons.person,
                ),
                ErrorText(viewModel.emailError),
                SubmitButton(
                    onPressed: () {
                      if (viewModel.firstName != '' &&
                          viewModel.lastName != '' &&
                          viewModel.email != '' &&
                          viewModel.firstNameError == '' &&
                          viewModel.lastNameError == '' &&
                          viewModel.emailError == '') {
                        //Navigator.pushNamed(context, RegisterCustomerEmailPasswordRoute);
                        viewModel.updateProfile();
                      } else {
                        viewModel.checkFirstNameError();
                        viewModel.checkLastNameError();
                        viewModel.checkEmailError();
                      }
                    },
                    text: 'Update Profile'),
                FlatButton(
                  onPressed: () {
                    viewModel.resetViewModel();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeRoute, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
