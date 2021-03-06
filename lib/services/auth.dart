import 'auth_exception_handler.dart';
import 'database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/manager.dart';

// Firebase authentication services
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates user object based on firebase user
  static Future _userFromFirebaseUser(FirebaseUser user) async {
    if (user == null) {
      return null;
    }
    String userType = await DatabaseService(uuid: user.uid).userType();
    if (userType == "customer") {
      Map customerData = await DatabaseService(uuid: user.uid).getCustomerData();
      return Customer(customerData["firstName"], customerData["lastName"], user.uid, customerData["email"]);
    } else if (userType == "manager"){
      Map managerData = await DatabaseService(uuid: user.uid).getManagerData(); //
      return Manager(managerData["storeName"], managerData['storeWebsite'], managerData['storePhone'], managerData["storeAddress"], user.uid, managerData["email"]);
    } else {
      return null;
    }
  }

  /*
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
        _userFromFirebaseUser); //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }
  */

  Future currentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return await _userFromFirebaseUser(user);
  }

  // register with email & password
  Future registerCustomer(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String password}) async {
    AuthResultStatus _status;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: result.user.uid).createNewCustomer(
            firstName: firstName, lastName: lastName, email: email);
        await CurrentUser.signIn();
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  Future registerManager(
      { @required String storeName,
        @required String email,
        @required String storeWebsite,
        @required String storePhone,
        @required String storeAddress,
        @required String password}) async {
    AuthResultStatus _status;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: result.user.uid)
            .createNewManager(storeName: storeName,
                              email: email,
                              storeWebsite: storeWebsite,
                              storePhone: storePhone,
                              storeAddress: storeAddress);
        await CurrentUser.signIn();
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    AuthResultStatus _status;
    try {
      print('logging in');
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        await CurrentUser.signIn();
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      //FirebaseUser user = result.user;
      return Customer("guest", "", result.user.uid, "");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPassword(String email) async {
    AuthResultStatus _status;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _status = AuthResultStatus.successful;
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  Future updateEmail(String newEmail) async {
    AuthResultStatus _status;

    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: user.uid).updateEmail(newEmail);
        await user.updateEmail(newEmail);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
