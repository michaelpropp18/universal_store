import 'user.dart';
import 'item.dart';

class Manager extends User {
  String storeName;
  String storeWebsite;
  String storePhone;
  String storeAddress;
  Manager(this.storeName, this.storeWebsite, this.storePhone, this.storeAddress, String uid, String email) : super(uid, email, "manager");
  Manager.fromData(uid, Map managerData) : super(uid, managerData['email'], "manager") {
    this.storeName = managerData['storeName'];
    this.storeWebsite = managerData['storeWebsite'];
    this.storePhone = managerData['storePhone'];
    this.storeAddress = managerData['storeAddress'];
  }

  updateStoreName(String newName) async {
    this.storeName = newName;
    firestore.updateStoreName(newName);
  }

  updateStoreWebsite(String newWebsite) async {
    this.storeWebsite = newWebsite;
    firestore.updateStoreWebsite(newWebsite);
  }

  updateStorePhone(String newPhone) async {
    this.storePhone = newPhone;
    firestore.updateStorePhone(newPhone);
  }

  updateStoreAddress(String newAddress) async {
    this.storeAddress = newAddress;
    firestore.updateStoreAddress(newAddress);
  }

  addItemToInventory(String itemName, double price, int stock) {
    firestore.addItemToInventory(itemName, price, stock);
  }

  updateItemPrice(String itemUid, double price) {
    firestore.updateItemPrice(itemUid, price);
  }

  updateItemStock(String itemUid, int stock) {
    firestore.updateItemStock(itemUid, stock);
  }

  Future getInventory() async {
    return await firestore.getInventory();
  }

  Future getOrders() async {
    return await firestore.getStoreOrders();
  }

}