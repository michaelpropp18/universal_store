import 'package:flutter/material.dart';
import 'package:universal_store/models/cart_item.dart';

class CheckoutItem extends StatelessWidget {
  final CartItem item;

  const CheckoutItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.quantity.toString() + ' ' + item.item.name),
          Text((item.quantity * item.item.price).toStringAsFixed(2)),
        ],
      ),
    );
  }
}