import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/home/widgets/browse_header.dart';

import 'widgets/header.dart';
import 'widgets/product_card.dart';

class HomeStoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(text: 'Suggested products'),
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
            SizedBox(height: 20),
            BrowseHeader(text: 'SuperMart'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(number: 39),
                  ProductCard(number: 42),
                  ProductCard(number: 7),
                  ProductCard(number: 143),
                ],
              ),
            ),
            BrowseHeader(text: 'Target'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(number: 20),
                  ProductCard(number: 60),
                ],
              ),
            ),
            SizedBox(height: 20),
            Header(text: 'Featured Products'),
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
