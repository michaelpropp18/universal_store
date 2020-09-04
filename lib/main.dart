import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routing/router.dart' as router;
import 'models/user.dart';
import 'routing/routing_constants.dart';
import 'view/wrapper.dart';
import 'services/auth.dart';
import 'view_models/login_view_model.dart';
import 'view_models/register_customer_view_model.dart';
import 'view_models/register_manager_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<RegisterCustomerViewModel>(
            create: (BuildContext context) => RegisterCustomerViewModel(),
          ),
          ChangeNotifierProvider<LoginViewModel>(
              create: (BuildContext context) => LoginViewModel(),
          ),
          ChangeNotifierProvider<RegisterManagerViewModel>(
            create: (BuildContext context) => RegisterManagerViewModel(),
          ),
        ],
        child: MaterialApp(
          home: Wrapper(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          initialRoute: HomeRoute,
        ),
      ),
    );
  }
}
