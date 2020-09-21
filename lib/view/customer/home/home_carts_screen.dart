import 'package:flutter/material.dart';
import 'package:universal_store/models/carts.dart';

import 'widgets/cart_tab.dart';

class HomeCartsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: ListView.separated(padding: EdgeInsets.symmetric(vertical: 5),
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        shrinkWrap: true,
        itemCount: Carts.stores.length,
        itemBuilder: (context, index) {
          return CartTab(
            icon: Icons.shopping_cart,
            storeName: Carts.stores[index].storeName,
          );
        },
      ),
    );
  }
}
