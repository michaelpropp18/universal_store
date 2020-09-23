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

  Future userType() async {
    dynamic customer = await customers.document(uuid).get();
    if(customer.exists) {
      return "customer";    // make enum
    }
    dynamic manager = await managers.document(uuid).get();
    if(manager.exists) {
      return "manager";    // make enum
    }
    return "ERROR_USER_NOT_FOUND";
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

  Future updateEmail(String newEmail) async {
    if (await this.isCustomer()) {
      return await customers.document(uuid).updateData({'email': newEmail});
    } else if (await this.isManager()) {
      return await managers.document(uuid).updateData({'email': newEmail});
    }
  }

  Future updateFirstName(String newFirstName) async {
    return await customers.document(uuid).updateData({'firstName': newFirstName});
  }

  Future updateLastName(String newLastName) async {
    return await customers.document(uuid).updateData({'lastName': newLastName});
  }

  Future updateStoreName(String newStoreName) async {
    return await managers.document(uuid).updateData({'storeName': newStoreName});
  }

  Future getCustomerData() async {
    DocumentSnapshot customerData = await customers.document(uuid).get();
    return customerData.data;
  }

  Future getManagerData() async {
    DocumentSnapshot managerData = await managers.document(uuid).get();
    return managerData.data;
  }

}
