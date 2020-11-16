import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_bottom.dart';

class CheckoutScreen extends StatefulWidget {
  final Cart cart;

  const CheckoutScreen({this.cart});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Confirm Checkout', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        child: Text(widget.cart.subTotal.toString()),
      ),
      bottomNavigationBar: Container(
          child: CheckoutBottom(
        cart: widget.cart,
      )),
    );
  }
}
