import 'package:universal_store/services/auth.dart';
import 'package:universal_store/services/database.dart';

abstract class User {
  final String uid;
  DatabaseService firestore;
  AuthService auth;
  String userType;
  String email;
  User(this.uid, this.email, this.userType) {
    firestore = DatabaseService(uuid: uid);
    auth = AuthService();
  }

  updateEmail(String newEmail) async {
    this.email = newEmail;
    auth.updateEmail(newEmail);
  }

}
