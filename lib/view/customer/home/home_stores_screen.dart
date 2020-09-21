import 'package:flutter/material.dart';
import 'package:universal_store/models/stores.dart';

import 'widgets/cart_tab.dart';

class HomeStoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: ListView.separated(padding: EdgeInsets.symmetric(vertical: 5),
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        shrinkWrap: true,
        itemCount: Stores.stores.length,
        itemBuilder: (context, index) {
          return CartTab(
            icon: Icons.store,
            storeName: Stores.stores[index].name,
          );
        },
      ),
    );
  }
}
