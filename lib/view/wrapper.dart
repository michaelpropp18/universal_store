import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/models/user.dart';
import 'package:universal_store/view_models/login_view_model.dart';

import 'authentication/sign_in_screen.dart';
import 'customer/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return ChangeNotifierProvider<LoginViewModel>(
          create: (BuildContext context) => LoginViewModel(), child: SignIn());
    } else {
      return Home();
    }
  }
}
