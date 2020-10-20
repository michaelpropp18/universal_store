import 'manager.dart';

class Item {
  String uid;
  String name;
  String barcode;
  String description;
  double price;
  int stock;
  Manager store;

  Item({this.uid, this.name, this.barcode, this.description, this.price, this.stock, this.store});
  Item.fromData(this.uid, Map data) {
    this.name = data['itemName'];
    this.barcode = data['barcode'];
    this.description = data['description'];
    this.price = data['price'];
    this.stock = data['stock'];
    this.store = data['store'];
  }
}
