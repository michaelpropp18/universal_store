import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_item.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(widget.cart.store.storeName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(widget.cart.store.storeAddress, style: TextStyle(fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('Phone: ' + widget.cart.store.storePhone, style: TextStyle(fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Item', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Price', style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.cart.items.length,
                  itemBuilder: (context, index) {
                    return CheckoutItem(item: widget.cart.items[index]);
                  }),
            ),
            Text('***This is not a receipt'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          child: CheckoutBottom(
        cart: widget.cart,
      )),
    );
  }
}
