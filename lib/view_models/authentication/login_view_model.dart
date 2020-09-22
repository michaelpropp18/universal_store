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

  String _resetEmail; // email on reset password screen
  String _resetEmailError; // error for email on reset password screen
  String _resetRequestError; // error for password request itself

  final AuthService _auth = AuthService();
  bool _loading; // true if loading icon should be shown on the login screen

  LoginViewModel() {
    _email = '';
    _password = '';
    _resetEmail = '';
    _emailError = '';
    _passwordError = '';
    _loginError = '';
    _resetEmailError = '';
    _resetRequestError = '';
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

  void checkResetEmailError() {
    if (_resetEmail == '') {
      _resetEmailError = 'Email field cannot be empty';
    } else if (!_resetEmail.contains('@')) {
      _resetEmailError = 'Please enter a valid email';
    } else {
      _resetEmailError = '';
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

  void resetViewModel() {
    _email = '';
    _password = '';
    _resetEmail = '';
    _emailError = '';
    _passwordError = '';
    _loginError = '';
    _resetEmailError = '';
    _resetRequestError = '';
    _loading = false;
    notifyListeners();
  }

  /////////////////////////////////////////////////
  /// Sign in
  /////////////////////////////////////////////////

  /*
    Returns true if successful, false otherwise
  */
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
        notifyListeners();
        return false;
      } 
      resetViewModel();
      notifyListeners();
      return true;

    } else {
      checkEmailError();
      checkPasswordError();
      return false;
    }
  }

  /////////////////////////////////////////////////
  /// Forgot Password Reset
  /////////////////////////////////////////////////

  /*
    Returns true if successful, false otherwise
  */
  Future resetPassword() async {
    if (_resetEmail != '' && _resetEmailError == '') {
      _loading = true;
      notifyListeners();
      dynamic status = await _auth.resetPassword(_resetEmail);
      if (status != AuthResultStatus.successful) {
        _resetRequestError =
            AuthExceptionHandler.generateExceptionMessage(status);
        _loading = false;
        notifyListeners();
        return true;
      }
      _loading = false;
      notifyListeners();
      return false;
    } else {
      checkResetEmailError();
      notifyListeners();
      return false;
    }
  }

  /////////////////////////////////////////////////
  /// Getters
  /////////////////////////////////////////////////

  String get email {
    return _email;
  }

  String get resetEmail {
    return _resetEmail;
  }

  String get password {
    return _password;
  }

  String get emailError {
    return _emailError;
  }

  String get resetEmailError {
    return _resetEmailError;
  }

  String get resetRequestError {
    return _resetRequestError;
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

  set resetEmail(String resetEmail) {
    _resetEmail = resetEmail;
    checkResetEmailError();
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    checkPasswordError();
    notifyListeners();
  }
}
