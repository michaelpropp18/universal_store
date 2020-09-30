import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/models/store.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/attribute_box.dart';
import 'package:universal_store/view/shared/loading.dart';

import '../store_profile/header_tab.dart';
import '../../shared/attribute.dart';

class InventoryItemScreen extends StatefulWidget {
  final String uid;

  const InventoryItemScreen({this.uid});
  @override
  _InventoryItemScreenState createState() => _InventoryItemScreenState();
}

class _InventoryItemScreenState extends State<InventoryItemScreen> {
  Manager manager = CurrentUser.user;

  Future getItem() async {
    return manager.getInventory().then((items) {
      return items.firstWhere((e) => e.uid == widget.uid);
    });
  }

  Future navigateToItem(route) async {
    Navigator.pushNamed(context, route,
        arguments: <String, double>{'originalPrice': 444});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItem(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              brightness: Brightness.light, // this makes the status bar black
              iconTheme: new IconThemeData(
                  color: Colors.black), // this changes color of hamburger icon
              backgroundColor: Colors.white,
              title:
                  Text('Item Inventory', style: TextStyle(color: Colors.black)),
            ),
            body: Container(
              color: Colors.black12,
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  HeaderTab(
                    icon: Icons.add_a_photo,
                    title: snapshot.data.name,
                  ),
                  AttributeBox(
                    header: 'Information',
                    attributes: [
                      Attribute(
                        header: 'Price',
                        text: '\$' + snapshot.data.price.toStringAsFixed(2),
                        uid: snapshot.data.uid,
                        onPressed: () async {
                          Navigator.pushNamed(
                            context,
                            ManagerInventoryEditPrice,
                            arguments: snapshot.data.price,
                          ).then((price) {
                            if (price != null) {
                              manager.updateItemPrice(snapshot.data.uid, price);
                            }
                          }).then((_) =>
                              setState(() => manager = CurrentUser.user));
                        },
                      ),
                      Attribute(
                        header: 'Quantity',
                        text: snapshot.data.stock.toString(),
                        uid: snapshot.data.uid,
                        onPressed: () async {
                          Navigator.pushNamed(
                            context,
                            ManagerInventoryEditQuantity,
                            arguments: snapshot.data.stock,
                          ).then((quantity) {
                            if (quantity != null) {
                              manager.updateItemStock(
                                  snapshot.data.uid, quantity);
                            }
                          }).then((_) =>
                              setState(() => manager = CurrentUser.user));
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      manager.deleteItemFromInventory(snapshot.data.uid);
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Delete'.toUpperCase(),
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              brightness: Brightness.light, // this makes the status bar black
              iconTheme: new IconThemeData(
                  color: Colors.black), // this changes color of hamburger icon
              backgroundColor: Colors.white,
              title:
                  Text('Item Inventory', style: TextStyle(color: Colors.black)),
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
      },
    );
  }
}
