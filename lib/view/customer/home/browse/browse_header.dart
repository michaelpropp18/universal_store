import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';

class BrowseHeader extends StatelessWidget {
  final Manager store;

  const BrowseHeader({this.store});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, ViewStoreRoute, arguments: store),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.storeName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text('Category: Retail'),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            height: 30,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Shop',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
                return Navigator.pushNamed(context, ShoppingCartRoute,
                    arguments: store);
              },
            ),
          ),
        ],
      ),
    );
  }
}
