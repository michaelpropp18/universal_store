import 'package:flutter/material.dart';
// import 'package:universal_store/view_models/past_purchases.dart';
// import 'package:provider/provider.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';

class Purchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<PastPurchasesViewModel>(context);
    final Customer user = CurrentUser.user;
    final purchases = user.getOrders();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: new IconThemeData(
          color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('My Purchases', style: TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          final purchase = purchases[index];
          return ListTile(
          leading: Icon(Icons.home),
          title: Text(purchase.storeName),
          subtitle: Text('\$${purchases[index].price}'),
          trailing: Icon(Icons.arrow_right)
          );
        }
      )
    );
  }
}
