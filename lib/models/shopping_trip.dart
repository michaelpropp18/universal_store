import 'package:universal_store/models/item.dart';

class ShoppingTrip {

  String _storeName;
  double _price;
  int _date;
  List<Item> _items;

  ShoppingTrip(this._storeName, this._price, this._date);

  String get storeName {
    return _storeName;
  }

  double get price {
    return _price;
  }

  DateTime get date {
    return DateTime.fromMillisecondsSinceEpoch(_date).toLocal();
  }

  List<Item> get items {
    return _items;
  }
}