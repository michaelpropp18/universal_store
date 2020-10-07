import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/routing/routing_constants.dart';

class StoresList extends StatefulWidget {
  @override
  _StoresListState createState() => _StoresListState();
}

class _StoresListState extends State<StoresList> {
  Customer user;

  Future forceUpdate() async {
    Customer asyncCustomer = await CurrentUser.asyncUser;
    setState(() => user = asyncCustomer);
  }

  Future getStores() async {
    return await CurrentUser.asyncUser.then((customer) {
      user = customer;
      return user.getNearbyStores();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStores(),
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
                          onTap: () =>
                              Navigator.pushNamed(context, ViewStoreRoute)));
                });
          } else {
            return Container(
              color: Colors.black12,
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }
        });
  }
}

class Store {}
