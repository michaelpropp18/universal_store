import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/home/widgets/hidden_shopping_cart_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/shopping_cart_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/shopping_cart_item.dart';
import 'package:universal_store/view/customer/shop/widgets/stores_list.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ShoppingCartScreen extends StatefulWidget {
  final Manager store;

  const ShoppingCartScreen({this.store});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  Cart shoppingCart;

  Future getCart() async {
    Customer user = CurrentUser.user;
    dynamic carts = await user.getCarts();
    for (Cart cart in carts) {
      if (cart.store.uid == widget.store.uid) {
        setState(() {
          shoppingCart = cart;
        });
        return cart;
      }
    }
    /*
    Cart newCart = await user.createCart(widget.store);
    print('did this here');
    setState(() {
      shoppingCart = newCart;
    });
    return shoppingCart;
    */
    return null;
  }

  toggleBottom() {
    setState(() {
      showTotal = !showTotal;
    });
  }

  bool showTotal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Shopping Cart', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  "#ff6666", "Cancel", false, ScanMode.DEFAULT);
              Customer user = CurrentUser.user;
              Item item =
                  await user.getItemWithBarcode(widget.store, barcodeScanRes);
              if (item != null) {
                await shoppingCart.addItem(item, 1);
                print(item.name);
                print(barcodeScanRes);
              } else {
                print('item does not exist');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () async => Navigator.pushNamed(
                    context, AddItemCodeRoute,
                    arguments: shoppingCart)
                .then((_) {
              getCart();
            }),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getCart(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shoppingCart = snapshot.data;
              return ListView.builder(
                  itemCount: shoppingCart.items.length,
                  itemBuilder: (context, index) {
                    return ShoppingCartItem(
                      item: shoppingCart.items[index],
                      onDecrement: () {
                        shoppingCart.decrementItemQuantity(
                            shoppingCart.items[index].item);
                      },
                      onIncrement: () {
                        shoppingCart.incrementItemQuantity(
                            shoppingCart.items[index].item);
                      },
                      onDelete: () {
                        shoppingCart.removeItem(shoppingCart.items[index].item);
                      },
                    );
                  });
            } else {
              return Container(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
          }),
      bottomNavigationBar: Container(
          child: showTotal
              ? ShoppingCartBottom(
                  toggle: toggleBottom,
                  cart: shoppingCart,
                )
              : HiddenShoppingCartBottom(
                  toggle: toggleBottom,
                  cart: shoppingCart,
                )),
    );
  }
}
