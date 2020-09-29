import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';

class PurchasesList extends StatelessWidget {
  final Customer user = CurrentUser.user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user.getOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              if (i.isOdd) {
                return Divider();
              }
              final index = i ~/ 2;
              final purchase = snapshot.data[index];
              return ListTile(
              leading: Icon(Icons.home),
              title: Text(purchase.store.storeName),
              subtitle: Text('\$${snapshot.data[index].total}'),
              trailing: Icon(Icons.arrow_right)
              );
            }
          );
        } else {
          return Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 40.0),
            child: Text('No Purchases')
          );
        }
      }
    ); 
  }
}