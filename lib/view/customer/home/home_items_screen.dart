import 'package:flutter/material.dart';

import 'widgets/header.dart';
import 'widgets/product_card.dart';

class HomeItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(text: 'Suggested'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(number: 20),
                  ProductCard(number: 21),
                  ProductCard(number: 42),
                  ProductCard(number: 60),
                  ProductCard(number: 7),
                  ProductCard(number: 63),
                  ProductCard(number: 8),
                ],
              ),
            ),
            Header(text: 'Featured'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(number: 6),
                  ProductCard(number: 7),
                  ProductCard(number: 143),
                  ProductCard(number: 125),
                ],
              ),
            ),
            Header(text: 'Purchase Again'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(number: 201),
                  ProductCard(number: 202),
                  ProductCard(number: 203),
                  ProductCard(number: 204),
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
