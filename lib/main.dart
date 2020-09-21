import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routing/router.dart' as router;
import 'routing/routing_constants.dart';
import 'view/wrapper.dart';
import 'view_models/authentication/login_view_model.dart';
import 'view_models/authentication/registration_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegistrationViewModel>(
          create: (BuildContext context) => RegistrationViewModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (BuildContext context) => LoginViewModel(),
        ),
      ],
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: HomeRoute,
      ),
    );
  }
}
