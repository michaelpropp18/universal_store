import 'package:flutter/material.dart';

import 'continue_shopping_header.dart';
import '../widgets/product_card.dart';

class HomeCartsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContinueShoppingHeader(text: 'OutdoorMart'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 // ProductCard(number: 7),
                //  ProductCard(number: 143),
                ],
              ),
            ),
            ContinueShoppingHeader(text: 'Target'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 // ProductCard(number: 20),
                 // ProductCard(number: 60),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
