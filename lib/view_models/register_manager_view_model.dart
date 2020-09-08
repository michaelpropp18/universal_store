import 'package:flutter/foundation.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/auth_exception_handler.dart';

///////////////////////////////////////////////////
/// ViewModel for store manager account creation
///////////////////////////////////////////////////

class RegisterManagerViewModel with ChangeNotifier {
  /////////////////////////////////////////////////
  /// Attributes
  /////////////////////////////////////////////////

  String _storeName;
  String _email;
  String _password;
  String _confirmPassword;
  String _storeNameError;
  String _emailError;
  String _passwordError;
  String _confirmPasswordError;
  String _registerError;
  bool _loading;

  final AuthService _auth = AuthService();

  RegisterManagerViewModel() {
    _storeName = '';
    _email = '';
    _password = '';
    _confirmPassword = '';
    _storeNameError = '';
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
    _loading = false;
  }

  /////////////////////////////////////////////////
  /// Login Error Messages
  /////////////////////////////////////////////////

  void checkStoreNameError() {
    if (_storeName == '') {
      _storeNameError = 'Store name cannot be empty';
    } else {
      _storeNameError = '';
    }
    notifyListeners();
  }

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
    } else if (_password.length < 6) {
      _passwordError = 'Password must be at least 6 characters';
    } else {
      _passwordError = '';
    }
    notifyListeners();
  }

  void checkConfirmPasswordError() {
    if (_confirmPassword == '') {
      _confirmPasswordError = 'Password field cannot be empty';
    } else if (_confirmPassword != _password) {
      _confirmPasswordError = 'Passwords must match';
    } else {
      _confirmPasswordError = '';
    }
    notifyListeners();
  }

  void clearErrors() {
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
    notifyListeners();
  }

  void clearFields() {
    _storeName = '';
    _email = '';
    _password = '';
    _confirmPassword = '';
    notifyListeners();
  }

  void clearAll() {
    clearFields();
    clearErrors();
  }

  /////////////////////////////////////////////////
  /// Create Account
  /////////////////////////////////////////////////

  bool inputValid() {
    return _emailError == '' &&
        _passwordError == '' &&
        _confirmPasswordError == '' &&
        _email != '' &&
        _password != '' &&
        _confirmPassword != '';
  }

  /*
  Returns true if successful, false otherwise
  */
  Future createAccount() async {
    if (!inputValid()) {
      checkEmailError();
      checkPasswordError();
      checkConfirmPasswordError();
      return false;
    }

    // set loading = true so UI shows loading animation
    _loading = true;
    notifyListeners();

    //register with firebase
    dynamic status = await _auth.registerManager(
        storeName: _storeName,
        email: _email,
        password: _password);
    _loading = false;

    //registration successful
    if (status == AuthResultStatus.successful) {
      clearAll();
      return true;
    }

    //registration unsuccessful
    if (status == AuthResultStatus.emailAlreadyExists ||
        status == AuthResultStatus.invalidEmail) {
      _emailError = AuthExceptionHandler.generateExceptionMessage(status);
    } else {
      _registerError = AuthExceptionHandler.generateExceptionMessage(status);
    }
    notifyListeners();
    return false;
  }

  /////////////////////////////////////////////////
  /// Getters
  /////////////////////////////////////////////////

  String get storeName {
    return _storeName;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String get confirmPassword {
    return _confirmPassword;
  }

  String get storeNameError {
    return _storeNameError;
  }

  String get emailError {
    return _emailError;
  }

  String get passwordError {
    return _passwordError;
  }

  String get confirmPasswordError {
    return _confirmPasswordError;
  }

  String get registerError {
    return _registerError;
  }

  bool get loading {
    return _loading;
  }

  /////////////////////////////////////////////////
  /// Setters
  /////////////////////////////////////////////////

  set storeName(String storeName) {
    _storeName = storeName;
    checkStoreNameError();
    notifyListeners();
  }

  set email(String email) {
    _email = email;
    _registerError = '';
    checkEmailError();
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    _registerError = '';
    checkPasswordError();
    notifyListeners();
  }

  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _registerError = '';
    checkConfirmPasswordError();
    notifyListeners();
  }
}