import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/home/widgets/hidden_shopping_cart_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/shopping_cart_bottom.dart';
import 'package:universal_store/view/customer/home/widgets/shopping_cart_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
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
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () => Navigator.pushNamed(context, AddItemCodeRoute),
          ),
        ],
      ),
      body: ListView(
        children: [
          ShoppingCartItem(),
          ShoppingCartItem(),
          ShoppingCartItem(),
          ShoppingCartItem(),
          ShoppingCartItem(),
          ShoppingCartItem(),
          ShoppingCartItem(),
          //ShoppingCartBottom()
        ],
      ),
      bottomNavigationBar: Container(
          child: showTotal
              ? ShoppingCartBottom(
                  toggle: toggleBottom,
                )
              : HiddenShoppingCartBottom(
                  toggle: toggleBottom,
                )),
    );
  }
}
