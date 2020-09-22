import 'package:flutter/foundation.dart';
import 'package:universal_store/models/shopping_trip.dart';
import 'package:universal_store/models/user.dart';

class PastPurchasesViewModel with ChangeNotifier {

  List<ShoppingTrip> _purchases = <ShoppingTrip>[];

  PastPurchasesViewModel() {
    this._purchases = new User().getShoppingTrips();
  }

  List<ShoppingTrip> get purchases {
    return _purchases;
  }
}