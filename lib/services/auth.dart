import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'auth_exception_handler.dart';
import 'database.dart';

// Firebase authentication services
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
        _userFromFirebaseUser); //.map((FirebaseUser user) => _userFromFirebaseUser(user));
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
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  Future registerManager(
      {@required String storeName,
      @required String email,
      @required String password}) async {
    AuthResultStatus _status;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: result.user.uid)
            .createNewManager(storeName: storeName, email: email);
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
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
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

  Future updateFirstName(String newFirstName) async {
    AuthResultStatus _status;

    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: user.uid).updateFirstName(newFirstName);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  Future updateLastName(String newLastName) async {
    AuthResultStatus _status;

    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: user.uid).updateLastName(newLastName);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
    return _status;
  }

  Future updateCustomerProfile(String newFirstName, String newLastName, String newEmail) async {
    AuthResultStatus _status;

    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _status = AuthResultStatus.successful;
        await DatabaseService(uuid: user.uid).updateFirstName(newFirstName);
        await DatabaseService(uuid: user.uid).updateLastName(newLastName);
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

  Future getCustomerData() async {
    AuthResultStatus _status;

    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _status = AuthResultStatus.successful;
        return await DatabaseService(uuid: user.uid).getCustomerData();
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.getException(e);
    }
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
