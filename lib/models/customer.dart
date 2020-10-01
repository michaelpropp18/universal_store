import 'user.dart';
import 'manager.dart';
import 'order.dart';

class Customer extends User {
  String firstName;
  String lastName;
  Customer(this.firstName, this.lastName, String uid, String email)
      : super(uid, email, "customer");
  Customer.fromData(uid, Map customerData)
      : super(uid, customerData['email'], "customer") {
    this.firstName = customerData['firstName'];
    this.lastName = customerData['lastName'];
  }

  Future getItemWithBarcode(barcode) {
    // TODO return item with barcode, null if none exists
  }

  Future getStoreWithBarcode(barcode) {
    // TODO return store that has the item with this barcode
  }

  Future getNearbyStores() async {
    return await firestore.getNearbyStores();
  }

  Future getFeaturedProdcuts(store_uid) {
    // TODO return list of items to display to all users.
  }

  Future getSuggestedProducts() async {
    // TODO return custom list of items to display for user. Doesn't really have to be custom, just make sure its not the same as featured products.
  }

  Future getCarts() async {
    return await firestore.getCustomerCarts();
  }

  Future getOrders() async {
    return await firestore.getCustomerOrders();
  }

  updateFirstName(String newFirstName) async {
    this.firstName = newFirstName;
    firestore.updateFirstName(newFirstName);
  }

  updateLastName(String newLastName) async {
    this.lastName = newLastName;
    firestore.updateLastName(newLastName);
  }
}
