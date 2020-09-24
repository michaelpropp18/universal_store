import 'customer.dart';
import 'manager.dart';
import 'item.dart';
import 'cart_item.dart';
import 'cart.dart';

class Order {
  final String uid;
  Manager store;
  Customer customer;
  double total;
  DateTime date;
  List<CartItem> items;

  Order(this.uid, this.store, this.customer, this.date, this.items) {
    double subtotal = 0;
    for (CartItem item in items) {
      subtotal += item.item.price * item.quantity;
    }
    total = subtotal;
  }

  Order.fromCart(this.uid, Cart cart) {
    // TODO generate order from cart
  }

  Order.fromData(this.uid, this.store, this.customer, Map orderData) {
    this.date = orderData['date'];
    List<Map> items = orderData['items'];
  }
}