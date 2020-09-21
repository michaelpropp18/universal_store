import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

import '../../../../services/auth.dart';

class CustomerDrawer extends StatelessWidget {
  final tiles = [
    {'icon': Icons.account_circle, 'text': 'Profile', 'route': ProfileRoute},
    {'icon': Icons.shopping_cart, 'text': 'Purchases', 'route': PurchasesRoute},
    {'icon': Icons.payment, 'text': 'Payment', 'route': PaymentRoute},
    {'icon': Icons.lock, 'text': 'Privacy', 'route': PrivacyRoute},
    {'icon': Icons.comment, 'text': 'Feedback', 'route': FeedbackRoute},
    {'icon': Icons.help, 'text': 'Help', 'route': HelpRoute},
    {
      'icon': Icons.exit_to_app,
      'text': 'Sign Out',
      'onTap': () async => await AuthService().signOut(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return DrawerHeader(
                child: Column(
                  children: [
                    Icon(Icons.account_circle, size: 90.0, color: Colors.blue),
                    SizedBox(height: 6),
                    Text('John Doe', textScaleFactor: 1.8,),
                  ]
                )
              );
            } else {
              index = index - 1;
              return Container(
                child: ListTile(
                  onTap: tiles[index].containsKey('onTap')
                      ? tiles[index]['onTap'] // signOut isn't a route so we handle it differently
                      : () =>
                          Navigator.pushNamed(context, tiles[index]['route']),
                  leading: Icon(
                    tiles[index]['icon'],
                  ),
                  trailing: Text(tiles[index]['text']),
                ),
              );
            }
          },
          itemCount: tiles.length + 1,
        ),
      ),
    );
  }
}
