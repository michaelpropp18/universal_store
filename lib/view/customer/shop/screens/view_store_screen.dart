import 'package:flutter/material.dart';

class ViewStoreScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String website;

  const ViewStoreScreen(
      {@required this.name = '',
      @required this.email = '',
      @required this.phone = '',
      @required this.website = ''});

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
          child: Column(
        children: [
          Text(name),
          Text(email),
          Text(phone),
          Text(website),
        ],
      )),
    );
  }
}
