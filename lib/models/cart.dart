import 'package:universal_store/models/item.dart';

import 'customer.dart';
import 'manager.dart';
import 'cart_item.dart';

class Cart {
  String uid;
  Customer customer;
  Manager store;
  List<CartItem> items;
  double total;

  Cart(this.uid, this.store, this.customer, this.items) {
    double subtotal = 0;
    for (CartItem item in items) {
      subtotal += item.item.price * item.quantity;
    }
    total = subtotal;
  }

  addItem(Item item, int quantity) async {
    // TODO
  }

  removeItem(Item item) {
    // TODO
  }

  updateItemQuantity(Item item, int quantity) {
    // TODO
  }

}
