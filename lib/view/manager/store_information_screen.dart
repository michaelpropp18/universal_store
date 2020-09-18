import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
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
                          radius: 50,
                          //backgroundImage: AssetImage(''),
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
            SizedBox(
              height: 10,
            ),
            StoreAttributeBox(
              header: 'General Information',
              storeAttributes: [
                StoreAttribute(
                    header: 'Email', text: 'outdoormart@outdoormart.com'),
                StoreAttribute(header: 'Website', text: 'www.outdoormart.com'),
                StoreAttribute(header: 'Phone', text: '(404)-444-4444'),
                StoreAttribute(
                    header: 'Address',
                    text: '123 Northside Dr, \nAtlanta, GA 30313'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(height: 10),
            StoreAttributeBox(
              header: 'Features',
              storeAttributes: [
                StoreAttribute(header: 'Home Delivery', text: 'No'),
                StoreAttribute(header: 'In-Store Pickup', text: 'No'),
                StoreAttribute(header: 'Membership', text: 'No'),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
