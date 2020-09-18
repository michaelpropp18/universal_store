import 'package:flutter/foundation.dart';

class PastPurchasesViewModel with ChangeNotifier {

  String _customerId;
  final _purchases = <Purchase>[];

  PastPurchasesViewModel() {
    // Dummy data for now
    _customerId = "Test Customer";
    for (int i = 0; i < 10; i++) {
      purchases.add(Purchase('Store ${i}', i + .99, i ^ 2 + 1));
    }
  }

  String get customerId {
    return _customerId;
  }

  List<Purchase> get purchases {
    return _purchases;
  }

}

class Purchase {

  String _storeName;
  double _price;
  int _numItems;

  Purchase(this._storeName, this._price, this._numItems);

  String get storeName {
    return _storeName;
  }

  double get price {
    return _price;
  }

  int get numItems {
    return _numItems;
  }
}