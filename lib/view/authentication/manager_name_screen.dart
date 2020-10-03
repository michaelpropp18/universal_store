import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/authentication/widgets/back_arrow.dart';
import 'package:universal_store/view/shared/loading.dart';
import 'package:universal_store/view_models/registration_view_model.dart';

import 'widgets/background_gradient.dart';
import '../shared/error_text.dart';
import 'widgets/input_field.dart';
import 'widgets/submit_button.dart';

class ManagerNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        BackgroundGradient(),
        BackArrow(onSubmitted: () {
          viewModel.resetViewModel();
          Navigator.pop(context);
        }),
        Container(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20,
            top: 85.0,
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
                error: viewModel.storeNameError != '',
                textInputType: TextInputType.text,
                hintText: 'Store Name',
                onChanged: (t) {
                  viewModel.storeName = t;
                },
                icon: Icons.person,
              ),
              ErrorText(viewModel.storeNameError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.storePhoneError != '',
                textInputType: TextInputType.text,
                hintText: 'Store Phone Number',
                onChanged: (t) {
                  viewModel.storePhone = t;
                },
                icon: Icons.person,
              ),
              ErrorText(viewModel.storePhoneError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.storeWebsiteError != '',
                textInputType: TextInputType.text,
                hintText: 'Store Website',
                onChanged: (t) {
                  viewModel.storeWebsite = t;
                },
                icon: Icons.person,
              ),
              ErrorText(viewModel.storeWebsiteError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.storeAddressError != '',
                textInputType: TextInputType.text,
                hintText: 'Store Address',
                onChanged: (t) {
                  viewModel.storeAddress = t;
                },
                icon: Icons.person,
              ),
              ErrorText(viewModel.storeAddressError),
              SizedBox(height: 5),
              InputField(
                error: viewModel.storeCityError != '',
                textInputType: TextInputType.text,
                hintText: 'City',
                onChanged: (t) {
                  viewModel.storeCity = t;
                },
                icon: Icons.person,
              ),
              ErrorText(viewModel.storeCityError),
              SizedBox(height: 5),
              Row(
                children: [
                  Flexible(
                    flex: 10,
                    child: InputField(
                      error: viewModel.storeStateError != '',
                      textInputType: TextInputType.text,
                      hintText: 'State',
                      onChanged: (t) {
                        viewModel.storeState = t;
                      },
                      icon: Icons.person,
                    ),
                  ),
                  Spacer(flex: 1),
                  Flexible(
                    flex: 10,
                    child: InputField(
                      error: viewModel.storeZipError != '',
                      textInputType: TextInputType.text,
                      hintText: 'Zipcode',
                      onChanged: (t) {
                        viewModel.storeZip = t;
                      },
                      icon: Icons.person,
                    ),
                  ),
                ]
              ),
              ErrorText(viewModel.storeCityError),
              ErrorText(viewModel.storeZipError),
              SizedBox(height: 5),
              SubmitButton(
                  onPressed: () {
                    if (viewModel.storeName != '' &&
                        viewModel.storePhone != '' &&
                        viewModel.storeAddress != '' &&
                        viewModel.storeWebsite != '' &&
                        viewModel.storeNameError == '' &&
                        viewModel.storePhoneError == '' &&
                        viewModel.storeAddressError == '' &&
                        viewModel.storeWebsiteError == '') {
                      Navigator.pushNamed(
                        context, RegisterManagerEmailRoute
                      );
                    }
                  },
                  text: 'Next'),
              ErrorText(viewModel.registerError),
            ],
          ),
        ),
        if (viewModel.loading) Loading(),
      ]),
    );
  }
}
