import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

import 'header_tab.dart';
import '../../shared/attribute.dart';

import 'package:universal_store/models/current_user.dart';

class StoreInformationScreen extends StatefulWidget {
  @override
  _StoreInformationScreenState createState() => _StoreInformationScreenState();
}

class _StoreInformationScreenState extends State<StoreInformationScreen> {
  Manager manager = CurrentUser.user;

  Future forceUpdate() async {
    setState(() => manager = CurrentUser.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            HeaderTab(
              icon: Icons.store,
              title: manager.storeName,
            ),
            AttributeBox(
              header: 'General Information',
              attributes: [
                Attribute(
                  header: 'Email',
                  text: manager.email,
                  onPressed: () async {
                    Navigator.pushNamed(context, ManagerEditStoreEmailRoute)
                        .then((_) => forceUpdate());
                  },
                ),
                Attribute(
                  header: 'Website',
                  text: manager.storeWebsite,
                  onPressed: () async {
                    Navigator.pushNamed(context, ManagerEditStoreWebsiteRoute)
                        .then((_) => forceUpdate());
                  },
                ),
                Attribute(
                  header: 'Phone',
                  text: manager.storePhone,
                  onPressed: () async {
                    Navigator.pushNamed(context, ManagerEditStorePhoneRoute)
                        .then((_) => forceUpdate());
                  },
                ),
                Attribute(
                  header: 'Address',
                  text: manager.storeAddress,
                  onPressed: () async {
                    Navigator.pushNamed(context, ManagerEditStoreAddressRoute)
                        .then((_) => forceUpdate());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
