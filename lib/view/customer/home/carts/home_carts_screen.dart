import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/current_user.dart';

import 'continue_shopping_header.dart';
import '../widgets/product_card.dart';

class HomeCartsScreen extends StatefulWidget {
  @override
  _HomeCartsScreenState createState() => _HomeCartsScreenState();
}

class _HomeCartsScreenState extends State<HomeCartsScreen> {
  Future getCarts() async {
    dynamic user = await CurrentUser.asyncUser;
    dynamic carts = await user.getCarts();
    return carts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCarts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < snapshot.data.length; i++) 
                      ContinueShoppingHeader(text: snapshot.data[i].store.storeName, store: snapshot.data[i].store),
                    /*
                    ContinueShoppingHeader(text: 'OutdoorMart'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // ProductCard(number: 7),
                          //  ProductCard(number: 143),
                        ],
                      ),
                    ),
                    ContinueShoppingHeader(text: 'Target'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // ProductCard(number: 20),
                          // ProductCard(number: 60),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    */
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }
        });
  }
}
