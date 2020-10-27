import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_item.dart';
import 'package:universal_store/view/customer/shop/widgets/stores_list.dart';

class CheckoutScreen extends StatefulWidget {
  final Manager store;

  const CheckoutScreen({this.store});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Cart checkoutCart;

  Future getCart() async {
    Customer user = CurrentUser.user;
    dynamic carts = await user.getCarts();
    for (Cart cart in carts) {
      if (cart.store.uid == widget.store.uid) {
        setState(() {
          checkoutCart = cart;
        });
        return cart;
      }
    }
    Cart newCart = await user.createCart(widget.store);
    setState(() {
      checkoutCart = newCart;
    });
    return checkoutCart;
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
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder(
          future: getCart(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              checkoutCart = snapshot.data;
              return ListView.builder(
                  itemCount: checkoutCart.items.length,
                  itemBuilder: (context, index) {
                    return CheckoutItem(
                      item: checkoutCart.items[index],
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
          child: CheckoutBottom(
            cart: checkoutCart,
          )
      )
    );
  }
}
