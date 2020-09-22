import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/services/auth.dart';
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
                  NavIcon(
                    icon: Icons.store,
                    text: 'My Store',
                    onPressed: () =>
                        Navigator.pushNamed(context, ManagerStoreRoute),
                  ),
                  NavIcon(
                    icon: Icons.shopping_basket,
                    text: 'My Inventory',
                    onPressed: () =>
                        Navigator.pushNamed(context, ManagerInventoryRoute),
                  ),
                ],
              ),
              TableRow(
                children: [
                  NavIcon(
                    icon: Icons.receipt,
                    text: 'My Orders',
                    onPressed: () =>
                        Navigator.pushNamed(context, ManagerOrdersRoute),
                  ),
                  NavIcon(
                    icon: Icons.attach_money,
                    text: 'Payment',
                    onPressed: () =>
                        Navigator.pushNamed(context, ManagerPaymentRoute),
                  )
                ],
              ),
              TableRow(
                children: [
                  NavIcon(
                    icon: Icons.insert_chart,
                    text: 'Analytics',
                    onPressed: () {},
                  ),
                  NavIcon(
                    icon: Icons.exit_to_app,
                    text: 'Sign out',
                    onPressed: () async {
                      await AuthService().signOut();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
