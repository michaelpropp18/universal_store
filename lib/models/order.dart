import 'customer.dart';
import 'manager.dart';
import 'item.dart';
import 'cart_item.dart';
import 'cart.dart';

class Order {
  final String uid;
  Manager store;
  Customer customer;
  List<CartItem> items;
  DateTime date;
  double total;
  double subTotal;
  double processingFee;
  double tax;

  //Future iterations might require customer, date, items, etc. although they are not currently used
  Order(this.uid, this.store, this.customer, this.date, this.items, this.total, this.subTotal, this.processingFee, this.tax);

  Order.fromCart(this.uid, Cart cart) {
    // TODO generate order from cart
  }

  Order.fromData(this.uid, this.store, this.customer, Map orderData) {
    this.date = orderData['date'];
    List<Map> items = orderData['items'];
  }
}