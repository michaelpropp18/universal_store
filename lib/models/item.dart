class Item {
  String uid;
  String name;
  double price;
  int quantity;

  Item({this.uid, this.name, this.price, this.quantity});

  String getManagerTitle() {
    return quantity.toString() + ' X ' + name + ' \$' + price.toStringAsFixed(2);
  }
}
