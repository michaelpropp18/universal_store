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

  addItemToInventory(String itemName, String barcode, String description, double price, int stock) {
    firestore.addItemToInventory(itemName, barcode, description, price, stock, this);
  }

  deleteItemFromInventory(Item item) {
    firestore.deleteItemFromInventory(item);
  }

  updateItemPrice(Item item, double price) {
    firestore.updateItemPrice(item.uid, price);
  }

  updateItemStock(Item item, int stock) {
    firestore.updateItemStock(item.uid, stock);
  }

  updateItemBarcode(Item item, int barcode) {
    //TODO Sprint 5
  }

  updateItemDescription(Item item, String description) {
    //TODO Sprint 5
  }

  Future getInventory() async {
    return await firestore.getInventory();
  }

  Future getOrders() async {
    return await firestore.getStoreOrders();
  }

  Future getItemWithBarcode(String barcode) async {
    return await firestore.getItemWithBarcodeManager(barcode);
  }

}