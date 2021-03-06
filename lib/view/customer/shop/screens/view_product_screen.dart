import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/home/widgets/product_card.dart';
import 'package:universal_store/view/customer/shop/widgets/item_header_tab.dart';
import 'package:universal_store/view/manager/store_profile/header_tab.dart';
import 'package:universal_store/view/shared/attribute.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

class ViewProductScreen extends StatefulWidget {
  final Item product;

  const ViewProductScreen({this.product});

  @override
  _ViewProductScreenState createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  Future getCart() async {
    Customer user = CurrentUser.user;
    dynamic carts = await user.getCarts();
    for (Cart cart in carts) {
      if (cart.store.uid == widget.product.store.uid) {
        return cart;
      }
    }
    await user.createCart(widget.product.store);
    carts = await user.getCarts();
    for (Cart cart in carts) {
      if (cart.store.uid == widget.product.store.uid) {
        return cart;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text(widget.product.name, style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            AttributeBox(
              header: 'General Information',
              attributes: [
                Attribute(
                  header: 'Store',
                  text: widget.product.store.storeName,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Price',
                  text: '\$' + widget.product.price.toStringAsFixed(2),
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Quantity',
                  text: widget.product.stock.toString(),
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Description',
                  text: widget.product.description,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'Barcode',
                  text: widget.product.barcode,
                  showEditIcon: false,
                ),
              ],
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue)),
              onPressed: () async {
                Customer user = CurrentUser.user;
                Cart cart = await getCart();
                Item item = await user.getItemWithBarcode(
                    widget.product.store, widget.product.barcode);
                if (item != null) {
                  await cart.addItem(item, 1);
                }
                Navigator.pushNamedAndRemoveUntil(
                    context, ShoppingCartRoute, ModalRoute.withName(HomeRoute),
                    arguments: widget.product.store);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Add Item'.toUpperCase(),
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
