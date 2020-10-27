import 'package:flutter/material.dart';
import 'package:universal_store/models/cart_item.dart';

class CheckoutItem extends StatelessWidget {
  final CartItem item;

  const CheckoutItem(
      {this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://picsum.photos/250?image=21',
              width: 70,
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.item.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$' + item.item.price.toStringAsFixed(2),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
