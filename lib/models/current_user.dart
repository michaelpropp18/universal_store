import 'user.dart';
import 'package:universal_store/services/auth.dart';

class CurrentUser {
  static User _user;
  static User get user {
    if (_user == null) {
      signIn();
    }
    return _user;
  }
  
  static final AuthService _auth = AuthService();

  static signIn() async {
    _user = await _auth.currentUser();
  }
}