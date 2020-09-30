import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/inventory/store_item.dart';

import 'store_inventory_box.dart';

class StoreInventoryScreen extends StatefulWidget {
  @override
  _StoreInventoryScreenState createState() => _StoreInventoryScreenState();
}

class _StoreInventoryScreenState extends State<StoreInventoryScreen> {
  Manager manager;

  Future forceUpdate() async {
    Manager asyncManager = await CurrentUser.asyncUser;
    setState(() => manager = asyncManager);
  }

  Future getInventory() async {
    Manager asyncManager = await CurrentUser.asyncUser;
    manager = asyncManager;
    return manager.getInventory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getInventory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                brightness: Brightness.light,
                iconTheme: new IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title:
                    Text('My Inventory', style: TextStyle(color: Colors.black)),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      Navigator.pushNamed(context, ManagerInventoryAddItem)
                          .then((_) => forceUpdate());
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
                              onUpdate: forceUpdate,
                              uid: snapshot.data[index].uid);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                brightness: Brightness.light,
                iconTheme: new IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title:
                    Text('My Inventory', style: TextStyle(color: Colors.black)),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Container(
                color: Colors.black12,
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              ),
            );
          }
        });
  }
}
