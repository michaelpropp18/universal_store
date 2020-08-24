import 'package:flutter/foundation.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/auth_exception_handler.dart';

///////////////////////////////////////////////////
/// ViewModel for customer account creation
///////////////////////////////////////////////////

class RegisterCustomerViewModel with ChangeNotifier {
  /////////////////////////////////////////////////
  /// Attributes
  /////////////////////////////////////////////////

  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _confirmPassword;
  String _firstNameError;
  String _lastNameError;
  String _emailError;
  String _passwordError;
  String _confirmPasswordError;
  String _registerError;
  bool _loading;

  final AuthService _auth = AuthService();

  RegisterCustomerViewModel() {
    _firstName = '';
    _lastName = '';
    _email = '';
    _password = '';
    _confirmPassword = '';
    _firstNameError = '';
    _lastNameError = '';
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
    _loading = false;
  }

  /////////////////////////////////////////////////
  /// Login Error Messages
  /////////////////////////////////////////////////

  void checkFirstNameError() {
    if (_firstName == '') {
      _firstNameError = 'First Name cannot be empty';
    } else {
      _firstNameError = '';
    }
    notifyListeners();
  }

  void checkLastNameError() {
    if (_lastName == '') {
      _lastNameError = 'Last Name cannot be empty';
    } else {
      _lastNameError = '';
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
    dynamic status = await _auth.registerCustomer(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        password: _password);
    _loading = false;

    //registration successful
    if (status == AuthResultStatus.successful) {
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

  String get firstName {
    return _firstName;
  }

  String get lastName {
    return _lastName;
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

  String get firstNameError {
    return _firstNameError;
  }

  String get lastNameError {
    return _lastNameError;
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

  set firstName(String firstName) {
    _firstName = firstName;
    checkFirstNameError();
    notifyListeners();
  }

  set lastName(String lastName) {
    _lastName = lastName;
    checkLastNameError();
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
