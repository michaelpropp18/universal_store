import 'package:flutter/foundation.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/auth_exception_handler.dart';

///////////////////////////////////////////////////
/// ViewModel for login screen
///////////////////////////////////////////////////
class LoginViewModel with ChangeNotifier {
  /////////////////////////////////////////////////
  /// Attributes and Constructor
  /////////////////////////////////////////////////

  String _email;
  String _password;
  String _emailError;
  String _passwordError;
  String _loginError;
  final AuthService _auth = AuthService();
  bool _loading; // true if loading icon should be shown on the screen

  LoginViewModel() {
    _email = '';
    _password = '';
    _emailError = '';
    _passwordError = '';
    _loginError = '';
    _loading = false;
  }

  /////////////////////////////////////////////////
  /// Login Error Messages
  /////////////////////////////////////////////////

  void checkEmailError() {
    if (_email == '') {
      _emailError = 'Email field cannot be empty';
    } else if (!_email.contains('@')) {
      _emailError = 'Please enter a valid email';
    } else {
      _emailError = '';
    }
    notifyListeners();
  }

  void checkPasswordError() {
    if (_password == '') {
      _passwordError = 'Password field cannot be empty';
    } else {
      _passwordError = '';
    }
    notifyListeners();
  }

  void clearErrors() {
    _emailError = '';
    _passwordError = '';
    _loginError = '';
    notifyListeners();
  }

  /////////////////////////////////////////////////
  /// Sign in
  /////////////////////////////////////////////////

  Future signIn() async {
    if (_email != '' &&
        _password != '' &&
        _emailError == '' &&
        _passwordError == '') {
      _loading = true;
      notifyListeners();
      dynamic status =
          await _auth.signInWithEmailAndPassword(_email, _password);
      _loading = false;
      if (status != AuthResultStatus.successful) {
        _loginError = AuthExceptionHandler.generateExceptionMessage(status);
      }
      notifyListeners();
    } else {
      checkEmailError();
      checkPasswordError();
    }
  }

  /////////////////////////////////////////////////
  /// Getters
  /////////////////////////////////////////////////

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String get emailError {
    return _emailError;
  }

  String get passwordError {
    return _passwordError;
  }

  String get loginError {
    return _loginError;
  }

  bool get loading {
    return _loading;
  }

  /////////////////////////////////////////////////
  /// Setters
  /////////////////////////////////////////////////

  set email(String email) {
    _email = email;
    checkEmailError();
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    checkPasswordError();
    notifyListeners();
  }
}
