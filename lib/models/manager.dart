import 'user.dart';
import 'item.dart';

class Manager extends User {
  String storeName;
  Manager(this.storeName, String uid, String email) : super(uid, email, "manager");

  List<Item> getInventory() {
    return [];
  }

  addItemToInventory(Item item) {
    //
  }
}