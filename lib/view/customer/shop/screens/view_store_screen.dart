import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/shop/widgets/stores_list.dart';
import 'package:universal_store/view/manager/store_profile/header_tab.dart';
import 'package:universal_store/view/shared/attribute.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

class ViewStoreScreen extends StatefulWidget {
  final Manager store;

  const ViewStoreScreen({this.store});

  @override
  _ViewStoreScreenState createState() => _ViewStoreScreenState();
}

class _ViewStoreScreenState extends State<ViewStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('View Store', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            HeaderTab(
              icon: Icons.store,
              title: widget.store.storeName,
            ),
            AttributeBox(
              header: 'General Information',
              attributes: [
                Attribute(
                  header: 'Email',
                  text: widget.store.email,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Website',
                  text: widget.store.storeWebsite,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Phone',
                  text: widget.store.storePhone,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Address',
                  text: widget.store.storeAddress,
                  showEditIcon: false,
                ),
              ],
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, ShoppingCartRoute, ModalRoute.withName(HomeRoute),
                    arguments: widget.store);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Start Shopping'.toUpperCase(),
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
