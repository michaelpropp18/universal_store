import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/view_models/past_purchases.dart';

import 'routing/router.dart' as router;
import 'routing/routing_constants.dart';
import 'view/wrapper.dart';
import 'view_models/authentication/login_view_model.dart';
import 'view_models/authentication/registration_view_model.dart';
import 'view_models/update_profile_view_model.dart';
import 'view_models/login_view_model.dart';
import 'view_models/registration_view_model.dart';

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
        ChangeNotifierProvider<PastPurchasesViewModel>(
          create: (BuildContext context) => PastPurchasesViewModel(),
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
