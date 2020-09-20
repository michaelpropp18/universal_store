import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/widgets/store_attribute_box.dart';

import 'widgets/store_attribute.dart';

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
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 110,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 50,
                        child: Icon(
                          Icons.store,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'OutdoorMart',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            StoreAttributeBox(
              header: 'General Information',
              storeAttributes: [
                StoreAttribute(
                  header: 'Email',
                  text: 'outdoormart@outdoormart.com',
                  route: ManagerEditStoreEmailRoute,
                ),
                StoreAttribute(
                  header: 'Website',
                  text: 'www.outdoormart.com',
                  route: ManagerEditStoreWebsiteRoute,
                ),
                StoreAttribute(
                  header: 'Phone',
                  text: '(404)-444-4444',
                  route: ManagerEditStorePhoneRoute,
                ),
                StoreAttribute(
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
            */
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
          ],
        ),
      ),
    );
  }
}
