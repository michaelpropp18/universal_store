import 'item.dart';
import 'user.dart';
import 'manager.dart';
import 'order.dart';
import 'cart.dart';

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

  Future getItemWithBarcode(Manager store, String barcode) async {
    return await firestore.getItemWithBarcodeCustomer(store, barcode);
  }

  Future getStoreWithBarcode(barcode) {
    // TODO return store that has the item with this barcode
  }

  Future getNearbyStores() async {
    return await firestore.getNearbyStores();
  }

  Future getFeaturedProducts(Manager store) async {
    // TODO: just returns all items now. In the future, add a page where the manager can set featured products.
    return await firestore.getStoreInventory(store);
  }

  Future getSuggestedProducts() async {
    // TODO: just returns all items. In the future, add recommendation system.
    List suggestedProducts = new List();
    List stores = await this.getNearbyStores();
    for (Manager store in stores) {
      List storeInventory = await firestore.getStoreInventory(store);
      if (storeInventory.length > 0) {
        for (Item item in storeInventory) {
           suggestedProducts.add(item);
        }
      }
    }
    return suggestedProducts;
  }

  Future createCart(Manager store) async {
    return await firestore.createCart(store);
  }

  Future getCarts() async {
    return await firestore.getCustomerCarts();
  }

  Future deleteCart(Cart cart) async {
    return await firestore.deleteCart(cart);
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
