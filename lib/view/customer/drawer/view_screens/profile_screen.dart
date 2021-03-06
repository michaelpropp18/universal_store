import 'package:flutter/material.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/manager/store_profile/header_tab.dart';
import 'package:universal_store/view/shared/attribute.dart';
import 'package:universal_store/view/shared/attribute_box.dart';
import 'package:universal_store/models/current_user.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Customer user = CurrentUser.user;

  Future forceUpdate() async {
    setState(() => user = CurrentUser.user);
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
              icon: Icons.person,
              title: user.firstName + " " + user.lastName,
            ),
            AttributeBox(
              header: 'Profile Information',
              attributes: [
                Attribute(
                  header: 'First Name',
                  text: user.firstName,
                  onPressed: () async {
                    Navigator.pushNamed(context, EditCustomerFirstRoute)
                        .then((_) => forceUpdate());
                  },
                ),
                Attribute(
                  header: 'Last Name',
                  text: user.lastName,
                  onPressed: () async {
                    Navigator.pushNamed(context, EditCustomerLastRoute)
                        .then((_) => forceUpdate());
                  },
                ),
                Attribute(
                  header: 'Email',
                  text: user.email,
                  onPressed: () async {
                    Navigator.pushNamed(context, EditCustomerEmailRoute)
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
