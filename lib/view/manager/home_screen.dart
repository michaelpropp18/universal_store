import 'package:flutter/material.dart';
import 'package:universal_store/view/manager/widgets/nav_icon.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title:
              Text('Manager Dashboard', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Table(
            children: [
              TableRow(
                children: [
                  NavIcon(icon: Icons.store, text: 'My Store'),
                  NavIcon(icon: Icons.shopping_basket, text: 'My Inventory'),
                ],
              ),
              TableRow(
                children: [
                  NavIcon(icon: Icons.receipt, text: 'My Orders'),
                  //NavIcon(icon: Icons.insert_chart, text: 'Analytics'),
                  NavIcon(icon: Icons.attach_money, text: 'Payment')
                ],
              ),
              /*
              TableRow(
                children: [NavIcon(icon: Icons.home, text: 'Test')],
              )
              */
            ],
          ),
        ),
      ),
    );
  }
}
