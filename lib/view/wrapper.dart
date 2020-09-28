import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:universal_store/models/user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/services/database.dart';

import 'authentication/sign_in_screen.dart';
import 'customer/home/home_screen.dart';
import 'manager/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: convertToUser(FirebaseAuth.instance.onAuthStateChanged),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.data.userType == "customer") {
            return Home();
          } else if (snapshot.data.userType == "manager") {
            return HomeScreen();
          } else {
            print('Valididated user using firebase auth but is not customer or manager');
            return Home();
          }
        } else {
          return SignIn();
        }
      },
    );
  }

  //TODO move this somewhere better
  Stream<User> convertToUser(Stream<FirebaseUser> source) async* {
    await for (var user in source) {
      if (user != null) {
        if (await DatabaseService(uuid: user.uid).isCustomer()) {
          Map customerData = await DatabaseService(uuid: user.uid).getCustomerData();
          yield Customer(customerData["firstName"], customerData["lastname"], user.uid, customerData["email"]);
        } else if (await DatabaseService(uuid: user.uid).isManager()) {
          Map managerData = await DatabaseService(uuid: user.uid).getManagerData();
          yield Manager(managerData["storeName"], managerData['storeWebsite'], managerData['storePhone'], managerData['storeAddress'], user.uid, managerData["email"]);
        } else {
          Map customerData = await DatabaseService(uuid: user.uid).getCustomerData();
          yield Customer(customerData["firstName"], customerData["lastname"], user.uid, customerData["email"]);
        }
      } else {
        yield null;
      }
    }
  }
}
