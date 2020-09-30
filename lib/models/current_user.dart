import 'user.dart';
import 'package:universal_store/services/auth.dart';

class CurrentUser {
  static User _user;

  /*
  Call this if there is a chance the user could be null
  */
  static Future<User> get asyncUser async {
    if (_user == null) {
      await signIn();
    }
    return _user;
  }

  /*
  Call this if we know that the user is not null
  */
  static get user {
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
