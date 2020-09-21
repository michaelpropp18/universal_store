import 'package:flutter/material.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/store.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/widgets/store_item.dart';

import 'widgets/store_inventory_box.dart';

class StoreInventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('My Inventory', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          /*
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          */
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, ManagerInventoryAddItem);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            StoreInventoryBox(
              header: 'Clothing',
              inventoryItems: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Store.items.length,
                itemBuilder: (context, index) {
                  return StoreItem(
                      quantity: Store.items[index].quantity,
                      price: Store.items[index].price,
                      name: Store.items[index].name,
                      uid: Store.items[index].uid);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
