import 'customer.dart';
import 'manager.dart';
import 'item.dart';

class Order {
  final String uid;
  Manager store;
  Customer customer;
  double total;
  DateTime date;
  Order(this.uid, this.store, this.customer);

  List<Item> getItems() {
    return [];
  }
}