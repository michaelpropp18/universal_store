import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/widgets/header_tab.dart';
import 'package:universal_store/view/shared/attribute.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

class Profile extends StatelessWidget {
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
              icon: Icons.person,
              title: 'John Doe',
            ),
            AttributeBox(
              header: 'Profile Information',
              attributes: [
                Attribute(
                  header: 'First Name',
                  text: 'John',
                  route: EditCustomerFirstRoute,
                ),
                Attribute(
                  header: 'First Name',
                  text: 'John',
                  route: EditCustomerLastRoute,
                ),
                Attribute(
                  header: 'Email',
                  text: 'customer@customer.com',
                  route: EditCustomerEmailRoute,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
