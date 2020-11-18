import 'cart_item.dart';
import 'customer.dart';
import 'item.dart';
import 'manager.dart';

class Cart {
  String uid;
  Customer customer;
  Manager store;
  List<CartItem> items;
  double total;
  double subTotal;
  double processingFee;
  double tax;

  Cart(this.uid, this.store, this.customer, this.items) {
    double subtotal = 0;
    for (CartItem item in items) {
      subtotal += item.item.price * item.quantity;
    }
    subTotal = subtotal;
    tax = 0.089 * subTotal; //0.089 is simulating tax in the area 
    processingFee = 0.01 * subTotal; //0.01 is simulating the processing fee
    total = subTotal + tax + processingFee;
  }

  addItem(Item item, int quantity) async {
    if (items.indexWhere((cartItem) => cartItem.item.uid == item.uid) != -1) {
      incrementItemQuantity(item);
    } else {
      items.add(new CartItem(item, quantity));
      customer.firestore.addItemToCart(this, item, quantity);
    }
  }

  incrementItemQuantity(Item item) {
    int quantity =
        items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity +
            1;
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity =
        quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }

  decrementItemQuantity(Item item) {
    int quantity =
        items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity -
            1;
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity =
        quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }

  removeItem(Item item) {
    items.removeWhere((cartItem) => cartItem.item.uid == item.uid);
    customer.firestore.removeItemFromCart(this, item);
  }

  updateItemQuantity(Item item, int quantity) {
    if (quantity <= 0) {
      return this.removeItem(item);
    }
    items.lastWhere((cartItem) => cartItem.item.uid == item.uid).quantity =
        quantity;
    customer.firestore.updateItemQuantityInCart(this, item, quantity);
  }
}
