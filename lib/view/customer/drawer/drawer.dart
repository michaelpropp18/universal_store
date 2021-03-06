import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/shared/loading.dart';

import '../../../services/auth.dart';

class CustomerDrawer extends StatefulWidget {
  @override
  _CustomerDrawerState createState() => _CustomerDrawerState();
}

class _CustomerDrawerState extends State<CustomerDrawer> {
  Customer user;

  Future forceUpdate() async {
    Customer asyncCustomer = await CurrentUser.asyncUser;
    setState(() => user = asyncCustomer);
  }

  final tiles = [
    {'icon': Icons.account_circle, 'text': 'Profile', 'route': ProfileRoute},
    {'icon': Icons.shopping_cart, 'text': 'Purchases', 'route': PurchasesRoute},
    {'icon': Icons.payment, 'text': 'Payment', 'route': PaymentRoute},
    {'icon': Icons.lock, 'text': 'Privacy', 'route': PrivacyRoute},
    {'icon': Icons.help, 'text': 'Help', 'route': HelpRoute},
    {
      'icon': Icons.exit_to_app,
      'text': 'Sign Out',
      'onTap': () async => await AuthService().signOut(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CurrentUser.asyncUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return Drawer(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return DrawerHeader(
                          child: Column(children: [
                        Icon(Icons.account_circle,
                            size: 90.0, color: Colors.blue),
                        SizedBox(height: 6),
                        Text(
                          user == null
                              ? " "
                              : user.firstName + " " + user.lastName,
                          textScaleFactor: 1.8,
                        ),
                      ]));
                    } else {
                      index = index - 1;
                      return Container(
                        child: ListTile(
                          onTap: tiles[index].containsKey('onTap')
                              ? tiles[index][
                                  'onTap'] // signOut isn't a route so we handle it differently
                              : () => Navigator.pushNamed(
                                      context, tiles[index]['route'])
                                  .then((_) => forceUpdate()),
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
          } else {
            return Loading();
          }
        });
  }
}
