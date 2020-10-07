import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/view/customer/home/browse/browse_header.dart';

import 'product_card.dart';

class StoreBrowseRow extends StatelessWidget {
  final double cardHeight = 256;
  final Manager manager;
  final dynamic products;

  const StoreBrowseRow({this.manager, this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        BrowseHeader(store: manager),
        Container(
          height: cardHeight, // TODO: figure out how to not do this
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(item: products[index]);
              }),
        ),
      ],
    );
  }
}
