import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/account_type_screen.dart';
import 'package:universal_store/view/authentication/customer_fields_screen.dart';
import 'package:universal_store/view/authentication/manager_fields_screen.dart';
import 'package:universal_store/view/customer/drawer/feedback_screen.dart';
import 'package:universal_store/view/customer/drawer/help_screen.dart';
import 'package:universal_store/view/customer/drawer/payment_screen.dart';
import 'package:universal_store/view/customer/drawer/privacy_screen.dart';
import 'package:universal_store/view/customer/drawer/profile_screen.dart';
import 'package:universal_store/view/customer/drawer/purchases_screen.dart';

import 'package:universal_store/view/wrapper.dart';

import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // wrapper returns home screen if logged in or login screen if logged out
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => Wrapper());

    // registering a new account routes
    case RegisterTypeRoute:
      return MaterialPageRoute(builder: (context) => AccountType());
    case RegisterCustomerRoute:
      return MaterialPageRoute(builder: (context) => CustomerFields());
    case RegisterManagerRoute:
      return MaterialPageRoute(builder: (context) => ManagerFields());

    //drawer
    case ProfileRoute:
      return MaterialPageRoute(builder: (context) => Profile());
    case PurchasesRoute:
      return MaterialPageRoute(builder: (context) => Purchases());
    case PaymentRoute:
      return MaterialPageRoute(builder: (context) => Payment());
    case PrivacyRoute:
      return MaterialPageRoute(builder: (context) => Privacy());
    case FeedbackRoute:
      return MaterialPageRoute(builder: (context) => FeedbackInput());
    case HelpRoute:
      return MaterialPageRoute(builder: (context) => Help());

    // default. We should never get here, but if we do return home or login screen based on login status
    default:
          print('got here 2');
      return MaterialPageRoute(builder: (context) => Wrapper());
  }
}
