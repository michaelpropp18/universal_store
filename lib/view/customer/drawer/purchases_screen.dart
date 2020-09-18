import 'package:flutter/material.dart';
import 'package:universal_store/view_models/past_purchases.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PastPurchasesViewModel>(context);
    final purchases = viewModel.purchases;
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
          title: Text(purchase.storeName),
          subtitle: Text('${purchase.date.month}/${purchase.date.day}/${purchase.date.year}'),
          trailing: Text('\$${purchases[index].price}'),
          );
        }
      )
    );
  }
}
