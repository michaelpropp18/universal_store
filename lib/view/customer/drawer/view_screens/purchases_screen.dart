import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/drawer/widgets/purchases_list.dart';

class Purchases extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: new IconThemeData(
          color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('My Purchases', style: TextStyle(color: Colors.black))
      ),
      body: PurchasesList()
    );
  }
}
