import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uuid;
  DatabaseService({this.uuid});

  // collection reference
  final CollectionReference customers =
      Firestore.instance.collection('customers');

  Future createNewCustomer(
      {@required String firstName,
      @required String lastName,
      @required String email}) async {
    return await customers.document(uuid).setData(
        {'firstName': firstName, 'lastName': lastName, 'email': email});
  }
}
