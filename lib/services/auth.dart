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

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    AuthResultStatus _status;
    try {
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
