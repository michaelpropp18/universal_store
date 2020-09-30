import 'package:flutter/material.dart';

import 'package:universal_store/view/authentication/account_type_screen.dart';
import 'package:universal_store/view/authentication/customer_email_screen.dart';
import 'package:universal_store/view/authentication/customer_name_screen.dart';
import 'package:universal_store/view/authentication/forgot_password_screen.dart';
import 'package:universal_store/view/authentication/manager_fields_screen.dart';
import 'package:universal_store/view/customer/drawer/edit_screens.dart/edit_customer_email_screen.dart';
import 'package:universal_store/view/customer/drawer/edit_screens.dart/edit_customer_first_screen.dart';
import 'package:universal_store/view/customer/drawer/edit_screens.dart/edit_customer_last_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/purchases_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/feedback_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/help_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/payment_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/privacy_screen.dart';
import 'package:universal_store/view/customer/drawer/view_screens/profile_screen.dart';
import 'package:universal_store/view/customer/shop/screens/add_item_code_screen.dart';
import 'package:universal_store/view/customer/shop/screens/search_screen.dart';
import 'package:universal_store/view/customer/shop/screens/select_store_screen.dart';
import 'package:universal_store/view/customer/shop/screens/shopping_cart_screen.dart';
import 'package:universal_store/view/customer/shop/screens/view_product_screen.dart';
import 'package:universal_store/view/customer/shop/screens/view_store_screen.dart';
import 'package:universal_store/view/manager/analytics/analytics_screen.dart';
import 'package:universal_store/view/manager/inventory/edit_item_price_screen.dart';
import 'package:universal_store/view/manager/inventory/edit_item_quantity_screen.dart';
import 'package:universal_store/view/manager/store_profile/edit_store_address_screen.dart';
import 'package:universal_store/view/manager/store_profile/edit_store_email_screen.dart';
import 'package:universal_store/view/manager/store_profile/edit_store_phone_screen.dart';
import 'package:universal_store/view/manager/store_profile/edit_store_website_screen.dart';
import 'package:universal_store/view/manager/inventory/inventory_item_screen.dart';
import 'package:universal_store/view/manager/store_profile/store_information_screen.dart';
import 'package:universal_store/view/manager/inventory/store_inventory_screen.dart';
import 'package:universal_store/view/manager/orders/store_orders_screen.dart';
import 'package:universal_store/view/manager/payment/store_payment_screen.dart';
import 'package:universal_store/view/manager/inventory/add_item_screen.dart';

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
    case RegisterCustomerNameRoute:
      return MaterialPageRoute(
          builder: (context) => RegisterCustomerNameScreen());
    case RegisterCustomerEmailPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => RegisterCustomerEmailPasswordScreen());
    case RegisterManagerRoute:
      return MaterialPageRoute(builder: (context) => ManagerFieldsScreen());
    case ForgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());

    //customer drawer
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

    //edit customer fields
    case EditCustomerFirstRoute:
      return MaterialPageRoute(builder: (context) => EditCustomerFirstScreen());
    case EditCustomerLastRoute:
      return MaterialPageRoute(builder: (context) => EditCustomerLastScreen());
    case EditCustomerEmailRoute:
      return MaterialPageRoute(builder: (context) => EditCustomerEmailScreen());

    //customer
    case SearchRoute:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    case ShoppingCartRoute:
      return MaterialPageRoute(builder: (context) => ShoppingCartScreen());
    case ViewProductRoute:
      return MaterialPageRoute(builder: (context) => ViewProductScreen());
    case ViewStoreRoute:
      return MaterialPageRoute(builder: (context) => ViewStoreScreen());
    case AddItemCodeRoute:
      return MaterialPageRoute(builder: (context) => AddItemCodeScreen());
    case SelectStoreRoute:
      return MaterialPageRoute(builder: (context) => SelectStoreScreen());

    //primary manager routes
    case ManagerStoreRoute:
      return MaterialPageRoute(builder: (context) => StoreInformationScreen());
    case ManagerInventoryRoute:
      return MaterialPageRoute(builder: (context) => StoreInventoryScreen());
    case ManagerOrdersRoute:
      return MaterialPageRoute(builder: (context) => StoreOrdersScreen());
    case ManagerPaymentRoute:
      return MaterialPageRoute(builder: (context) => StorePaymentScreen());
    case ManagerAnalyticsRoute:
      return MaterialPageRoute(builder: (context) => AnalyticsScreen());

    //store profile
    case ManagerEditStoreEmailRoute:
      return MaterialPageRoute(builder: (context) => EditStoreEmailScreen());
    case ManagerEditStoreWebsiteRoute:
      return MaterialPageRoute(builder: (context) => EditStoreWebsiteScreen());
    case ManagerEditStorePhoneRoute:
      return MaterialPageRoute(builder: (context) => EditStorePhoneScreen());
    case ManagerEditStoreAddressRoute:
      return MaterialPageRoute(builder: (context) => EditStoreAddressScreen());

    //store inventory
    case ManagerInventoryItemRoute:
      return MaterialPageRoute(
          builder: (context) => InventoryItemScreen(uid: settings.arguments));
    case ManagerInventoryEditPrice:
      return MaterialPageRoute(
          builder: (context) => EditItemPriceScreen(price: settings.arguments));
    case ManagerInventoryEditQuantity:
      return MaterialPageRoute(
          builder: (context) =>
              EditItemQuantityScreen(quantity: settings.arguments));
    case ManagerInventoryAddItem:
      return MaterialPageRoute(builder: (context) => AddItemScreen());

    // default. We should never get here, but if we do return home or login screen based on login status
    default:
      debugPrint(
          'Used default route in route.dart. You probably attempted to use an undefined route!');
      return MaterialPageRoute(builder: (context) => Wrapper());
  }
}
