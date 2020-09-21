import 'package:flutter/material.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/view/manager/widgets/store_item.dart';

import 'widgets/store_inventory_box.dart';

class StoreInventoryScreen extends StatelessWidget {
  final List<Item> items = [
    Item(uid: '1001', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1002', name: 'Camping Tent', price: 109.99, quantity: 8),
    Item(uid: '1003', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1004', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1005', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1006', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1007', name: 'Hiking Boots', price: 39.99, quantity: 10),
  ];
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
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreInventoryBox(
              header: 'Clothing',
              inventoryItems: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                   return StoreItem(quantity: items[index].quantity, price: items[index].price, name: items[index].name);
                },
              ),
            ),
            
          ],
        ),
      ),
      /*
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return StoreItem(text: 'test', name: items[index].name);
            /*
            return ListTile(
              title: Text('${items[index].getManagerTitle()}'),
            );
            */
          },
        ),
      ),
      */
    );
  }
}
