import 'package:flutter/material.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/models/user.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

import 'widgets/header_tab.dart';
import '../shared/attribute.dart';

import 'package:universal_store/models/current_user.dart';

class StoreInformationScreen extends StatelessWidget {
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
              title: 'OutdoorMart',
            ),
            AttributeBox(
              header: 'General Information',
              attributes: [
                Attribute(
                  header: 'Email',
                  text: 'outdoormart@outdoormart.com',
                  route: ManagerEditStoreEmailRoute,
                ),
                Attribute(
                  header: 'Website',
                  text: 'www.outdoormart.com',
                  route: ManagerEditStoreWebsiteRoute,
                ),
                Attribute(
                  header: 'Phone',
                  text: '(404)-444-4444',
                  route: ManagerEditStorePhoneRoute,
                ),
                Attribute(
                  header: 'Address',
                  text: '123 Northside Dr, \nAtlanta, GA 30313',
                  route: ManagerEditStoreAddressRoute,
                ),
              ],
            ),
            /*
            StoreAttributeBox(
              header: 'Description',
              storeAttributes: [
                StoreAttribute(
                    header: 'Description',
                    text:
                        'From backpacking to cycling to staying in shape and more, outfit your outdoor activities with the latest gear, clothing, and footwear at OutdoorMart.'),
                StoreAttribute(header: 'Type', text: 'Outdoor Clothing'),
                StoreAttribute(header: 'Price', text: 'Affordable'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            StoreAttributeBox(
              header: 'Hours',
              storeAttributes: [
                StoreAttribute(
                    header: 'Monday-Friday', text: '10:00 AM - 9:00 PM'),
                StoreAttribute(header: 'Saturday', text: '12:00 PM - 6:00 PM'),
                StoreAttribute(header: 'Sunday', text: 'Closed'),
              ],
            ),
            StoreAttributeBox(
              header: 'Features',
              storeAttributes: [
                StoreAttribute(
                  header: 'Home Delivery',
                  text: 'No',
                  route: ManagerEditStorePhoneRoute,
                ),
                StoreAttribute(
                  header: 'In-Store Pickup',
                  text: 'No',
                  route: ManagerEditStorePhoneRoute,
                ),
                StoreAttribute(
                  header: 'Membership',
                  text: 'No',
                  route: ManagerEditStorePhoneRoute,
                ),
              ],
            ),
                        */
          ],
        ),
      ),
    );
  }
}
