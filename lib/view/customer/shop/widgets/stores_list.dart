import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/routing/routing_constants.dart';

class StoresList extends StatelessWidget {
  final Customer user = CurrentUser.user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user.getNearbyStores(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              final store = snapshot.data[i];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(store.storeName),
                  subtitle: Text('${store.storePhone}'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () => Navigator.pushNamed(context, ViewStoreRoute)
                )
              );
            }
          );
        } else {
          return Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 40.0),
            child: Text('No Nearby Stores')
          );
        }
      }
    );
  }
}