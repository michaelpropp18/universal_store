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
    if (items.lastWhere((cartItem) => cartItem.item.uid == item.uid) != null) {
      incrementItemQuantity(item);
    } else {
      items.add(new CartItem(item, quantity));
      customer.firestore.addItemToCart(this, item, quantity);
    }
  }

  removeItem(Item item) {
    items.removeWhere((cartItem) => cartItem.item.uid == item.uid);
    customer.firestore.removeItemFromCart(this, item);
  }

  updateItemQuantity(Item item, int quantity) {
    if (quantity <= 0) {
      return this.removeItem(item);
    }
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity = quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }

  incrementItemQuantity(Item item) {
    int quantity = items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity + 1;
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity = quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }

  decrementItemQuantity(Item item) {
    int quantity = items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity - 1;
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity = quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }

}
