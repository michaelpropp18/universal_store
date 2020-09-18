import 'package:flutter/foundation.dart';

class PastPurchasesViewModel with ChangeNotifier {

  String _customerId;
  final _purchases = <Purchase>[];

  PastPurchasesViewModel() {
    // Dummy data for now
    _customerId = "Test Customer";
    for (int i = 0; i < 10; i++) {
      purchases.add(Purchase('Store $i', i + .99, DateTime.now().millisecondsSinceEpoch - (i * 3600 * 24000)));
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
  int _date;

  Purchase(this._storeName, this._price, this._date);

  String get storeName {
    return _storeName;
  }

  double get price {
    return _price;
  }

  DateTime get date {
    return DateTime.fromMillisecondsSinceEpoch(_date).toLocal();
  }
}