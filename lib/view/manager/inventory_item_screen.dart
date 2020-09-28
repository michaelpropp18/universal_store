import 'package:flutter/material.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/store.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

import 'widgets/header_tab.dart';
import '../shared/attribute.dart';

class InventoryItemScreen extends StatefulWidget {
  final String uid;

  const InventoryItemScreen({this.uid});
  @override
  _InventoryItemScreenState createState() => _InventoryItemScreenState();
}

class _InventoryItemScreenState extends State<InventoryItemScreen> {
  Item item;

  @override
  void initState() {
    item = Store.items.firstWhere((e) => e.uid == widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Item Inventory', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            HeaderTab(
              icon: Icons.add_a_photo, //TODO replace this with a scanner icon
              title: item.name,
            ),
            AttributeBox(
              header: 'Information',
              attributes: [
                Attribute(
                  header: 'Price',
                  text: '\$' + item.price.toStringAsFixed(2),
                  route: ManagerInventoryEditPrice,
                  //uid: item.uid,
                ),
                Attribute(
                  header: 'Quantity',
                  text: item.stock.toString(),
                  route: ManagerInventoryEditQuantity,
                  //uid: item.uid,
                ),
                /*
                StoreAttribute(
                  header: 'Category',
                  text: 'Clothing',
                  //route: ManagerEditStoreAddressRoute,
                ),
                StoreAttribute(
                  header: 'Item ID',
                  text: '139491',
                  //route: ManagerEditStorePhoneRoute,
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
