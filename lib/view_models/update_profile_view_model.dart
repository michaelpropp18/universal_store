import 'package:flutter/foundation.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/auth_exception_handler.dart';

///////////////////////////////////////////////////
/// ViewModel for customer and manager account creation
///////////////////////////////////////////////////

class UpdateProfileViewModel with ChangeNotifier {
  /////////////////////////////////////////////////
  /// Attributes
  /////////////////////////////////////////////////

  String _currentFirstName;
  String _currentLastName;
  String _currentEmail;

  String _firstName;
  String _lastName;
  String _email;

  String _firstNameError;
  String _lastNameError;
  String _emailError;

  bool _loading;
  String _updateError;

  final AuthService _auth = AuthService();

  UpdateProfileViewModel() {
    _currentFirstName = '';
    _currentLastName = '';
    _currentEmail = '';

    _firstName = '';
    _lastName = '';
    _email = '';

    _firstNameError = '';
    _lastNameError = '';
    _emailError = '';

    _loading = false;

    this.resetViewModel();
  }

  /////////////////////////////////////////////////
  /// Error Messages
  /////////////////////////////////////////////////

  bool checkFirstNameError() {
    bool check = true;
    if (_firstName == '') {
      _firstNameError = 'First Name cannot be empty';
      check = false;
    } else {
      _firstNameError = '';
    }
    notifyListeners();
    return check;
  }

  bool checkLastNameError() {
    bool check = true;
    if (_lastName == '') {
      _lastNameError = 'Last Name cannot be empty';
      check = false;
    } else {
      _lastNameError = '';
    }
    notifyListeners();
    return check;
  }

  bool checkEmailError() {
    bool check = true;
    if (_email == '') {
      _emailError = 'Email field cannot be empty';
      check = false;
    } else if (!_email.contains('@')) {
      _emailError = 'Please enter a valid email';
      check = false;
    } else {
      _emailError = '';
    }
    notifyListeners();
    return check;
  }

  /////////////////////////////////////////////////
  /// Reset
  /////////////////////////////////////////////////

  void resetViewModel() async {
    Map userData = await _auth.getCustomerData();

    if (userData['firstName'] != null) {
      _currentFirstName = userData['firstName'];
    } else {
      _currentFirstName = '';
    }

    if (userData['lastName'] != null) {
      _currentLastName = userData['lastName'];
    } else {
      _currentLastName = '';
    }

    if (userData['email'] != null) {
      _currentEmail = userData['email'];
    } else {
      _currentEmail = '';
    }

    _firstName = _currentFirstName;
    _lastName = _currentLastName;
    _email = _currentEmail;


    _firstNameError = '';
    _lastNameError = '';
    _emailError = '';
    _updateError = '';
    _loading = false;

    notifyListeners();
  }

  /////////////////////////////////////////////////
  /// Input Valid
  /////////////////////////////////////////////////

  bool customerInputValid() {
    return checkEmailError() &&
      checkFirstNameError() &&
      checkLastNameError();
  }

  /////////////////////////////////////////////////
  /// Create Account
  /////////////////////////////////////////////////

  /*
  Returns true if successful, false otherwise
  */
  Future updateProfile() async {
    if (!customerInputValid()) {
      return false;
    }

    // set loading = true so UI shows loading animation
    _loading = true;
    notifyListeners();

    //update
    dynamic status = await _auth.updateCustomerProfile(_firstName, _lastName, _email);
    _loading = false;

    //update successful
    if (status == AuthResultStatus.successful) {
      resetViewModel();
      return true;
    }

    //update unsuccessful
    if (status == AuthResultStatus.invalidEmail) {
      _emailError = AuthExceptionHandler.generateExceptionMessage(status);
    } else {
      _updateError = AuthExceptionHandler.generateExceptionMessage(status);
    }
    notifyListeners();
    return false;

  }


  /////////////////////////////////////////////////
  /// Getters
  /////////////////////////////////////////////////

  String get currentEmail {
    return _currentEmail;
  }

  String get email {
    return _email;
  }

  String get emailError {
    return _emailError;
  }

  bool get loading {
    return _loading;
  }

  String get firstName {
    return _firstName;
  }

  String get currentFirstName {
    return _currentFirstName;
  }

  String get firstNameError {
    return _firstNameError;
  }

  String get lastName {
    return _lastName;
  }

  String get currentLastName {
    return _currentLastName;
  }

  String get lastNameError {
    return _lastNameError;
  }

  /////////////////////////////////////////////////
  /// Setters
  /////////////////////////////////////////////////

  set email(String email) {
    _email = email;
    checkEmailError();
    notifyListeners();
  }

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

}
