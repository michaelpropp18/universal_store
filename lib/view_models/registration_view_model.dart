import 'package:flutter/foundation.dart';
import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/auth_exception_handler.dart';

///////////////////////////////////////////////////
/// ViewModel for customer and manager account creation
///////////////////////////////////////////////////

class RegistrationViewModel with ChangeNotifier {
  /////////////////////////////////////////////////
  /// Attributes
  /////////////////////////////////////////////////

  ///both
  String _email;
  String _password;
  String _confirmPassword;
  String _emailError;
  String _passwordError;
  String _confirmPasswordError;
  String _registerError;
  bool _loading;

  ///customer only
  String _firstName;
  String _lastName;
  String _firstNameError;
  String _lastNameError;

  /// Store Manager only
  String _storeName;
  String _storeNameError;
  String _storePhone;
  String _storePhoneError;
  String _storeAddress;
  String _storeAddressError;
  String _storeWebsite;
  String _storeWebsiteError;
  String _storeCity;
  String _storeCityError;
  String _storeState;
  String _storeStateError;
  String _storeZip;
  String _storeZipError;

  final AuthService _auth = AuthService();

  RegistrationViewModel() {
    ///both
    _email = '';
    _password = '';
    _confirmPassword = '';
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
    _loading = false;

    // customer only
    _firstName = '';
    _lastName = '';
    _firstNameError = '';
    _lastNameError = '';

    // store manager only
    _storeName = '';
    _storeNameError = '';
    _storePhone = '';
    _storePhoneError = '';
    _storeAddress = '';
    _storeAddressError = '';
    _storeWebsite = '';
    _storeWebsiteError = '';
    _storeCity = '';
    _storeCityError = '';
    _storeState = '';
    _storeStateError = '';
    _storeZip = '';
    _storeZipError = '';
  }

  /////////////////////////////////////////////////
  /// Manager Error Messages
  /////////////////////////////////////////////////

  void checkStoreNameError() {
    if (_storeName == '') {
      _storeNameError = 'Store name cannot be empty';
    } else {
      _storeNameError = '';
    }
    notifyListeners();
  }

  void checkStorePhoneError() {
    if (_storePhone == '') {
      _storePhoneError = 'Store phone number cannot be empty';
    } else {
      _storePhoneError = '';
    }
    notifyListeners();
  }

  void checkStoreAddressError() {
    if (_storeAddress == '') {
      _storeAddressError = 'Store address cannot be empty';
    } else {
      _storeAddressError = '';
    }
    notifyListeners();
  }

  void checkStoreWebsiteError() {
    if (_storeWebsite == '') {
      _storeWebsiteError = 'Store website cannot be empty';
    } else {
      _storeWebsiteError = '';
    }
    notifyListeners();
  }

  void checkStoreCityError() {
    if (_storeCity == '') {
      _storeCityError = 'City cannot be empty';
    } else {
      _storeCityError = '';
    }
    notifyListeners();
  }

  void checkStoreStateError() {
    if (_storeState == '') {
      _storeStateError = 'State cannot be empty';
    } else {
      _storeStateError = '';
    }
    notifyListeners();
  }

  void checkStoreZipError() {
    if (_storeZip == '') {
      _storeZipError = 'Zipcode cannot be empty';
    } else {
      _storeZipError = '';
    }
    notifyListeners();
  }

  /////////////////////////////////////////////////
  /// Customer Error Messages
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

  /////////////////////////////////////////////////
  /// Both Error Messages
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

  /////////////////////////////////////////////////
  /// Reset
  /////////////////////////////////////////////////

  void resetViewModel() {
    ///both
    _email = '';
    _password = '';
    _confirmPassword = '';
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
    _loading = false;

    ///customer only
    _firstName = '';
    _lastName = '';
    _firstNameError = '';
    _lastNameError = '';

    /// Store Manager only
    _storeName = '';
    _storeNameError = '';
    _storePhone = '';
    _storePhoneError = '';
    _storeAddress = '';
    _storeAddressError = '';
    _storeWebsite = '';
    _storeWebsiteError = '';
    _storeCity = '';
    _storeCityError = '';
    _storeState = '';
    _storeStateError = '';
    _storeZip = '';
    _storeZipError = '';

    notifyListeners();
  }

  void resetCustomerEmailPassword() {
    _email = '';
    _password = '';
    _confirmPassword = '';
    _emailError = '';
    _passwordError = '';
    _confirmPasswordError = '';
    _registerError = '';
  }

  /////////////////////////////////////////////////
  /// Input Valid
  /////////////////////////////////////////////////

  bool customerInputValid() {
    return _emailError == '' &&
        _passwordError == '' &&
        _confirmPasswordError == '' &&
        _email != '' &&
        _password != '' &&
        _confirmPassword != '';
  }

  bool managerInputValid() {
    return _emailError == '' &&
        _passwordError == '' &&
        _confirmPasswordError == '' &&
        _email != '' &&
        _password != '' &&
        _confirmPassword != '';
  }

  /////////////////////////////////////////////////
  /// Create Account
  /////////////////////////////////////////////////

  /*
  Returns true if successful, false otherwise
  */
  Future createCustomerAccount() async {
    if (!customerInputValid()) {
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
      resetViewModel();
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

  /*
  Returns true if successful, false otherwise
  */
  Future createManagerAccount() async {
    if (!managerInputValid()) {
      checkStoreNameError();
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
        storePhone: _storePhone,
        storeWebsite: _storeWebsite,
        storeAddress: _storeAddress,
        storeCity: _storeCity,
        storeState: _storeState,
        storeZip: _storeZip,
        email: _email,
        password: _password);
    _loading = false;

    //registration successful
    if (status == AuthResultStatus.successful) {
      resetViewModel();
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

  ///both
  String get email {
    return _email;
  }

  String get emailError {
    return _emailError;
  }

  String get password {
    return _password;
  }

  String get passwordError {
    return _passwordError;
  }

  String get confirmPassword {
    return _confirmPassword;
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

  // customer only
  String get firstName {
    return _firstName;
  }

  String get firstNameError {
    return _firstNameError;
  }

  String get lastName {
    return _lastName;
  }

  String get lastNameError {
    return _lastNameError;
  }

  // store manager only

  String get storeName {
    return _storeName;
  }

  String get storeNameError {
    return _storeNameError;
  }

  String get storePhone {
    return _storePhone;
  }

  String get storePhoneError {
    return _storePhoneError;
  }

  String get storeAddress {
    return _storeAddress;
  }

  String get storeAddressError {
    return _storeAddressError;
  }

  String get storeWebsite {
    return _storeWebsite;
  }

  String get storeWebsiteError {
    return _storeWebsiteError;
  }

  String get storeCity {
    return _storeCity;
  }

  String get storeCityError {
    return _storeCityError;
  }

  String get storeState {
    return _storeState;
  }
  
  String get storeStateError {
    return _storeStateError;
  }

  String get storeZip {
    return _storeZip;
  }
  
  String get storeZipError {
    return _storeZipError;
  }

  /////////////////////////////////////////////////
  /// Setters
  /////////////////////////////////////////////////

  // both

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

  // customer only

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

  // store manager only

  set storeName(String storeName) {
    _storeName = storeName;
    checkStoreNameError();
    notifyListeners();
  }

  set storePhone(String storePhone) {
    _storePhone = storePhone;
    checkStorePhoneError();
    notifyListeners();
  }

  set storeWebsite(String storeWebsite) {
    _storeWebsite = storeWebsite;
    checkStoreWebsiteError();
    notifyListeners();
  }

  set storeAddress(String storeAddress) {
    _storeAddress = storeAddress;
    checkStoreAddressError();
    notifyListeners();
  }

  set storeCity(String storeCity) {
    _storeCity = storeCity;
    checkStoreCityError();
    notifyListeners();
  }

  set storeState(String storeState) {
    _storeState = storeState;
    checkStoreStateError();
    notifyListeners();
  }

  set storeZip(String storeZip) {
    _storeZip = storeZip;
    checkStoreZipError();
    notifyListeners();
  }
}
