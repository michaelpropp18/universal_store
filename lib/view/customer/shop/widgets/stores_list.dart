import 'package:flutter/material.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/view/customer/home/widgets/store_card.dart';

class StoresList extends StatelessWidget {
  final Customer user = CurrentUser.user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user.getNearbyStores(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length * 2 - 1,
            itemBuilder: (context, i) {
              if (i.isOdd) {
                return Divider();
              }
              final index = i ~/ 2;
              final store = snapshot.data[index];
              return ListTile(
              leading: Icon(Icons.home),
              title: Text(store.storeName),
              subtitle: Text('${snapshot.data[index].storePhone}'),
              trailing: Icon(Icons.arrow_right)
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