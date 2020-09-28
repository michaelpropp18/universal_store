import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/models/store.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/widgets/store_item.dart';

import 'widgets/store_inventory_box.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/models/current_user.dart';


class StoreInventoryScreen extends StatelessWidget {
  final Manager manager = CurrentUser.user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: manager.getInventory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              iconTheme: new IconThemeData(
                  color: Colors.black),
              backgroundColor: Colors.white,
              title: Text('My Inventory', style: TextStyle(color: Colors.black)),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ManagerInventoryAddItem);
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
                    header: 'Items',
                    inventoryItems: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return StoreItem(
                            quantity: snapshot.data[index].stock,
                            price: snapshot.data[index].price,
                            name: snapshot.data[index].name,
                            uid: snapshot.data[index].uid);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(          // TODO Replace this with a loading screen
            appBar: AppBar(
              brightness: Brightness.light,
              iconTheme: new IconThemeData(
                  color: Colors.black),
              backgroundColor: Colors.white,
              title: Text('My Inventory', style: TextStyle(color: Colors.black)),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ManagerInventoryAddItem);
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
                    header: 'Items',
                    inventoryItems: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return StoreItem(
                            quantity: 0,
                            price: 0,
                            name: "",
                            uid: "");
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}
