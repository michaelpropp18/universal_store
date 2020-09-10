import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_store/models/user.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/database.dart';

import 'authentication/sign_in_screen.dart';
import 'customer/home/home_screen.dart';
import 'manager/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: transform(FirebaseAuth.instance.onAuthStateChanged),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.data.isCustomer) {
            return Home();
          } else if (snapshot.data.isManager) {
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

  Stream<User> transform(Stream<FirebaseUser> source) async* {
    await for (var user in source) {
      if (user != null) {
        if (await DatabaseService(uuid: user.uid).isCustomer()) {
          yield User(uid: user.uid, isCustomer: true, isManager: false);
        } else if (await DatabaseService(uuid: user.uid).isManager()) {
          yield User(uid: user.uid, isCustomer: false, isManager: true);
        } else {
          yield User(uid: user.uid, isCustomer: false, isManager: false);
        }
      } else {
        yield null;
      }
    }
  }
}
