import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/shop/widgets/stores_list.dart';

class SelectFromShoppingTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Select Shopping Trip', style: TextStyle(color: Colors.black)),
      ),
      body: Container(color: Colors.black12),
    );
  }
}
