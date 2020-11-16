import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';

class ContinueShoppingHeader extends StatelessWidget {
  final String text;
  final Manager store;
  final Cart cart;

  const ContinueShoppingHeader({this.text, this.store, this.cart});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('Total: \$' + cart.total.toStringAsFixed(2)),
            ],
          ),
          SizedBox(
            width: 160,
            height: 30,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, ShoppingCartRoute, arguments: store);
              },
            ),
          ),
        ],
      ),
    );
  }
}
