import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uuid;
  DatabaseService({this.uuid});

  // collection reference
  final CollectionReference customers =
      Firestore.instance.collection('customers');

  final CollectionReference managers =
      Firestore.instance.collection('managers');

  /*
    Returns true if the account associated with this uuid is a customer
  */
  Future isCustomer() async {
    dynamic customer = await customers.document(uuid).get();
    return customer.exists;
  }

  /*
    Returns true if the account associated with this uuid is a manager
  */
  Future isManager() async {
    dynamic manager = await managers.document(uuid).get();
    return manager.exists;
  }

  Future createNewCustomer(
      {@required String firstName,
      @required String lastName,
      @required String email}) async {
    return await customers.document(uuid).setData(
        {'firstName': firstName, 'lastName': lastName, 'email': email});
  }

  Future createNewManager(
      {@required String storeName, @required String email}) async {
    return await managers
        .document(uuid)
        .setData({'storeName': storeName, 'email': email});
  }
}
