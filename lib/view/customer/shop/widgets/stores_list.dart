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

  Future getStores() async {
    return await CurrentUser.asyncUser.then((customer) {
      user = customer;
      return user.getNearbyStores();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: FutureBuilder(
          future: getStores(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    final store = snapshot.data[i];
                    return Container(
                      padding: EdgeInsets.all(2),
                      child: Card(
                          elevation: 4,
                          child: ListTile(
                              leading: Icon(Icons.store,
                                  size: 35, color: Colors.black),
                              title: Text(
                                store.storeName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text('${store.storePhone}'),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  size: 30, color: Colors.black),
                              onTap: () => Navigator.pushNamed(
                                  context, ViewStoreRoute,
                                  arguments: store))),
                    );
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
          }),
    );
  }
}

class Store {}
