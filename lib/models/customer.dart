import 'user.dart';
import 'manager.dart';
import 'order.dart';

class Customer extends User {
  String firstName;
  String lastName;
  Customer(this.firstName, this.lastName, String uid, String email) : super(uid, email, "customer");

  List<Manager> getNearbyStores() {
    return [];
  }

  List<Order> getPastOrders() {
    return [];
  }
}