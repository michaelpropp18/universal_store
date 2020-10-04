class Item {
  String uid;
  String name;
  String barcode;
  String description;
  double price;
  int stock;

  Item({this.uid, this.name, this.barcode, this.description, this.price, this.stock});
  Item.fromData(this.uid, Map data) {
    this.name = data['itemName'];
    this.barcode = data['barcode'];
    this.description = data['description'];
    this.price = data['price'];
    this.stock = data['stock'];
  }
}
