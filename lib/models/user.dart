import 'package:universal_store/models/shopping_trip.dart';

class User {
  final String uid;

  // TODO: Implement backend functionality
  List<ShoppingTrip> getShoppingTrips() {
    // Return dummy data for now
    final shoppingTrips = <ShoppingTrip>[];
    for (int i = 0; i < 10; i++) {
      shoppingTrips.add(ShoppingTrip('Store $i', i + .99, DateTime.now().millisecondsSinceEpoch - (i * 3600 * 24000)));
    }
    return shoppingTrips;
  }

  bool isCustomer = false;
  bool isManager = false;
  User({this.uid, this.isCustomer, this.isManager});
}
