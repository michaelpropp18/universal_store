import 'item.dart';

class Store {
  static final List<Item> items = [ //TODO actually implement this
    Item(uid: '1001', name: 'Hiking Boots', price: 39.99, quantity: 10),
    Item(uid: '1002', name: 'Camping Tent', price: 109.99, quantity: 8),
    Item(uid: '1003', name: 'T-Shirt', price: 19.99, quantity: 31),
    Item(uid: '1004', name: 'Jeans', price: 36.99, quantity: 8),
    Item(uid: '1005', name: 'Sun glasses', price: 9.99, quantity: 8),
    Item(uid: '1006', name: 'Jacket', price: 79.99, quantity: 3),
    Item(uid: '1007', name: 'Rain boots', price: 39.99, quantity: 2),
  ];
  Store();
}
