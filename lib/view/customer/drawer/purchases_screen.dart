import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var purchases = <String>[];
    purchases.add("Item1");
    purchases.add("Item2");
    purchases.add("Item3");
    purchases.add("Price 1");
    purchases.add("Price 2");
    purchases.add("Price 3");
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
          return ListTile(
          title: Text(purchases[i ~/ 2]),
            trailing: Text(purchases[i ~/ 2 + purchases.length ~/ 2])
          );
        }
      )
    );
  }
}
