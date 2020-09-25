import 'package:flutter/material.dart';
// import 'package:universal_store/view_models/past_purchases.dart';
// import 'package:provider/provider.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/order.dart';

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  Customer user;
  List<Order> purchases;

  void initState() {
    super.initState();
    user = CurrentUser.user;
  }

  // void getPastOrders() async {
  //   this.purchases = await user.getOrders();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user.getOrders(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('No Data Yet');
        } else {
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              iconTheme: new IconThemeData(
                color: Colors.black),
              backgroundColor: Colors.white,
              title: Text('My Purchases', style: TextStyle(color: Colors.black)),
            ),
            body: purchases == null ? Text('Nothing yet') : ListView.builder(
              itemCount: purchases.length,
              itemBuilder: (context, i) {
                if (i.isOdd) {
                  return Divider();
                }
                final index = i ~/ 2;
                final purchase = purchases[index];
                return ListTile(
                leading: Icon(Icons.home),
                title: Text(purchase.store.storeName),
                subtitle: Text('\$${purchases[index].total}'),
                trailing: Icon(Icons.arrow_right)
                );
              }
            )
          );
        }
      }
    );
  }
}
