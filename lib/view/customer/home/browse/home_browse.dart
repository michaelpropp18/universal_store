import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/view/customer/home/browse/browse_header.dart';
import 'package:universal_store/view/customer/home/widgets/store_browse_row.dart';

import 'header.dart';
import '../widgets/product_card.dart';

class HomeStoresScreen extends StatefulWidget {
  @override
  _HomeStoresScreenState createState() => _HomeStoresScreenState();
}

class _HomeStoresScreenState extends State<HomeStoresScreen> {
  dynamic user;
  dynamic suggestedProducts;
  dynamic suggestedStores;
  dynamic suggestedStoreProducts1; // list of lists of products to display
  dynamic suggestedStoreProducts;
  final double cardHeight = 256;

  Future getUser() async {
    user = await CurrentUser.asyncUser;
    suggestedProducts = await user.getSuggestedProducts();
    suggestedStores = await user.getNearbyStores();
    dynamic listOfLists = [];
    for (Manager m in suggestedStores) {
      dynamic storeProducts = await user.getFeaturedProducts(m);
      listOfLists.add(storeProducts);
    }
    suggestedStoreProducts = listOfLists;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(text: 'Suggested products'),
                    Container(
                      height: cardHeight, // TODO: figure out how to not do this
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: suggestedProducts.length,
                          itemBuilder: (context, index) {
                            return ProductCard(item: suggestedProducts[index]);
                          }),
                    ),
                    for (var i = 0; i < suggestedStores.length; i++)
                      StoreBrowseRow(
                        manager: suggestedStores[i],
                        products: suggestedStoreProducts[i],
                      ),
                    /*
                    Header(text: 'Featured Products'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductCard(number: 6),
                          ProductCard(number: 7),
                          ProductCard(number: 143),
                          ProductCard(number: 125),
                        ],
                      ),
                    ),
                    Header(text: 'Purchase Again'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductCard(number: 201),
                          ProductCard(number: 202),
                          ProductCard(number: 203),
                          ProductCard(number: 204),
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
