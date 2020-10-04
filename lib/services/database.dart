import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:universal_store/models/manager.dart';
import 'package:universal_store/models/customer.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/order.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/cart_item.dart';

class DatabaseService {
  final String uuid;
  DatabaseService({this.uuid});

  // collection reference
  final CollectionReference customers =
  Firestore.instance.collection('customers');

  final CollectionReference managers =
  Firestore.instance.collection('managers');

  /*
    Returns true if the account associated with this uuid is a customer
  */
  Future isCustomer() async {
    dynamic customer = await customers.document(uuid).get();
    return customer.exists;
  }

  /*
    Returns true if the account associated with this uuid is a manager
  */
  Future isManager() async {
    dynamic manager = await managers.document(uuid).get();
    return manager.exists;
  }

  Future userType() async {
    dynamic customer = await customers.document(uuid).get();
    if(customer.exists) {
      return 'customer';    // make enum
    }
    dynamic manager = await managers.document(uuid).get();
    if(manager.exists) {
      return 'manager';    // make enum
    }
    return 'ERROR_USER_NOT_FOUND';
  }

  Future createNewCustomer(
      {@required String firstName,
        @required String lastName,
        @required String email}) async {
    return await customers.document(uuid).setData(
        {'firstName': firstName, 'lastName': lastName, 'email': email});
  }

  Future createNewManager(
      {@required String storeName, @required String email, @required String storeWebsite, @required String storePhone, @required String storeAddress}) async {
    return await managers
        .document(uuid)
        .setData({'storeName': storeName, 'email': email, 'storeWebsite': storeWebsite, 'storePhone': storePhone, 'storeAddress': storeAddress});
  }

  Future getCustomer(String uid) async {
    DocumentSnapshot customerData = await customers.document(uid).get();
    return Customer.fromData(uid, customerData.data);
  }

  Future getManager(String uid) async {
    DocumentSnapshot managerData = await managers.document(uid).get();
    return Manager.fromData(uid, managerData.data);
  }

  Future updateEmail(String newEmail) async {
    if (await this.isCustomer()) {
      return await customers.document(uuid).updateData({'email': newEmail});
    } else if (await this.isManager()) {
      return await managers.document(uuid).updateData({'email': newEmail});
    }
  }

  Future updateFirstName(String newFirstName) async {
    return await customers.document(uuid).updateData({'firstName': newFirstName});
  }

  Future updateLastName(String newLastName) async {
    return await customers.document(uuid).updateData({'lastName': newLastName});
  }

  Future updateStoreName(String newStoreName) async {
    return await managers.document(uuid).updateData({'storeName': newStoreName});
  }

  Future updateStoreWebsite(String newStoreWebsite) async {
    return await managers.document(uuid).updateData({'storeWebsite': newStoreWebsite});
  }

  Future updateStorePhone(String newStorePhone) async {
    return await managers.document(uuid).updateData({'storePhone': newStorePhone});
  }

  Future updateStoreAddress(String newStoreAddress) async {
    return await managers.document(uuid).updateData({'storeAddress': newStoreAddress});
  }

  Future getCustomerData() async {
    DocumentSnapshot customerData = await customers.document(uuid).get();
    return customerData.data;
  }

  Future getManagerData() async {
    DocumentSnapshot managerData = await managers.document(uuid).get();
    return managerData.data;
  }
  
  addItemToInventory(String itemName, String barcode, String description, double price, int stock) async {
    DocumentReference itemDocument = managers.document(uuid).collection('items').document();
    await itemDocument.setData({
      'itemName': itemName,
      'barcode': barcode,
      'description': description,
      'price': price,
      'stock': stock
    });
    await managers.document(uuid).collection('barcodes').document(barcode).setData({'item': itemDocument.documentID});
  }

  deleteItemFromInventory(Item item) async {
    await managers.document(uuid).collection('items').document(item.uid).delete();
  }

  updateItemPrice(String itemUid, double price) async {
    await managers.document(uuid).collection('items').document(itemUid).updateData({'price': price});
  }

  updateItemStock(String itemUid, int stock) async {
    await managers.document(uuid).collection('items').document(itemUid).updateData({'stock': stock});
  }

  Future getItemWithBarcodeCustomer(Manager store, String barcode) async {
    DocumentSnapshot barcodeDocument = await managers.document(store.uid).collection('barcodes').document(barcode).get();
    String itemUid = barcodeDocument.data['item'];
    DocumentSnapshot itemDocument = await managers.document(store.uid).collection('items').document(itemUid).get();
    Map itemData = itemDocument.data;
    Item item = Item.fromData(itemUid, itemData);
    return item;
  }

  Future getItemWithBarcodeManager(String barcode) async {
    DocumentSnapshot barcodeDocument = await managers.document(uuid).collection('barcodes').document(barcode).get();
    String itemUid = barcodeDocument.data['item'];
    DocumentSnapshot itemDocument = await managers.document(uuid).collection('items').document(itemUid).get();
    Map itemData = itemDocument.data;
    Item item = Item.fromData(itemUid, itemData);
    return item;
  }

  Future getInventory() async {
    QuerySnapshot qs = await managers.document(uuid).collection('items').getDocuments();
    List<DocumentSnapshot> documents = qs.documents;
    List<Item> items = new List();
    for (DocumentSnapshot document in documents) {
      Item item = Item.fromData(document.documentID, document.data);
      items.add(item);
    }
    return items;
  }

  Future getStoreInventory(Manager store) async {
    QuerySnapshot qs = await managers.document(store.uid).collection('items').getDocuments();
    List<DocumentSnapshot> documents = qs.documents;
    List<Item> items = new List();
    for (DocumentSnapshot document in documents) {
      Item item = Item.fromData(document.documentID, document.data);
      items.add(item);
    }
    return items;
  }

  Future getStoreOrders() async {
    QuerySnapshot ordersQuery = await managers.document(uuid).collection('orders').getDocuments();
    List<DocumentSnapshot> orderDocuments = ordersQuery.documents;
    List<Order> orders = new List();
    for (DocumentSnapshot orderDocument in orderDocuments) {
      Map orderData = orderDocument.data;
      Manager manager = await getManager(uuid);
      Customer customer = await getCustomer(orderData['customer']);
      List<CartItem> items = await getCartItems(manager, customer, orderData);
      Order order = new Order(orderDocument.documentID, manager, customer, (orderData['date'] as Timestamp).toDate(), items);
      orders.add(order);
    }
    return orders;
  }

  Future getCustomerOrders() async {
    QuerySnapshot ordersQuery = await customers.document(uuid).collection('orders').getDocuments();
    List<DocumentSnapshot> customerOrderDocuments = ordersQuery.documents;
    List<Order> orders = new List();
    for (DocumentSnapshot customerOrderDocument in customerOrderDocuments) {
      Map orderCustomerData = customerOrderDocument.data;
      Manager manager = await getManager(orderCustomerData['store']);
      Customer customer = await getCustomer(uuid);
      DocumentSnapshot orderDocument = await managers.document(orderCustomerData['store']).collection('orders').document(orderCustomerData['order']).get();
      Map orderData = orderDocument.data;
      List<CartItem> items = await getCartItems(manager, customer, orderData);
      Order order = new Order(orderDocument.documentID, manager, customer, (orderData['date'] as Timestamp).toDate(), items);
      orders.add(order);
    }
    return orders;
  }

  Future getCustomerCarts() async {
    QuerySnapshot cartsQuery = await customers.document(uuid).collection('carts').getDocuments();
    List<DocumentSnapshot> cartDocuments = cartsQuery.documents;
    List<Cart> carts = new List();
    for (DocumentSnapshot cartDocument in cartDocuments) {
      Map cartData = cartDocument.data;
      Manager manager = await getManager(cartData['store']);
      Customer customer = await getCustomer(uuid);
      List<CartItem> items = await getCartItems(manager, customer, cartData);
      Cart cart = new Cart(cartDocument.documentID, manager, customer, items);
      carts.add(cart);
    }
    return carts;
  }

  Future getCartItems(Manager manager, Customer customer, Map orderData) async {
    List<CartItem> items = new List();
    for (Map cartItemData in orderData['items']) {
      DocumentSnapshot itemDocument = await managers.document(manager.uid).collection('items').document(cartItemData['item']).get();
      Map itemData = itemDocument.data;
      Item item = new Item(uid: itemDocument.documentID, name: itemData['name'], price: itemData['price'], stock: itemData['stock']);
      CartItem cartItem = new CartItem(item, cartItemData['quantity']);
      items.add(cartItem);
    }
    return items;
  }

  Future createCart(Manager store) async {
    await customers.document(uuid).collection('carts').document().setData({
    'store': store.uid,
    'items': []
    });
  }

  Future deleteCart(Cart cart) async {
    await customers.document(uuid).collection('carts').document(cart.uid).delete();
  }

  Future addItemToCart(Cart cart, Item item, int quantity) async {
    if (quantity <= 0) {
      return;
    }
    DocumentSnapshot cartDocument = await customers.document(uuid).collection('carts').document(cart.uid).get();
    Map cartData = cartDocument.data;
    cartData['items'].add({'item': item.uid, 'quantity': quantity});
    await customers.document(uuid).collection('carts').document(cart.uid).updateData(cartData);
  }

  Future removeItemFromCart(Cart cart, Item item) async {
    DocumentSnapshot cartDocument = await customers.document(uuid).collection('carts').document(cart.uid).get();
    Map cartData = cartDocument.data;
    cartData['items'].removeWhere((cartItem) => cartItem['item'] == item.uid);
    await customers.document(uuid).collection('carts').document(cart.uid).updateData(cartData);
  }

  Future updateItemQuantityInCart(Cart cart, Item item, int quantity) async {
    if (quantity <= 0) {
      return removeItemFromCart(cart, item);
    }
    DocumentSnapshot cartDocument = await customers.document(uuid).collection('carts').document(cart.uid).get();
    Map cartData = cartDocument.data;
    cartData['items'].lastWhere((cartItem) => cartItem['item'] == item.uid)['quantity'] = quantity;
    await customers.document(uuid).collection('carts').document(cart.uid).updateData(cartData);
  }

  Future getNearbyStores() async {    // TODO This currently just returns all stores, do something more appropriate
    List<Manager> stores = new List();
    QuerySnapshot managerQuery = await managers.getDocuments();
    List<DocumentSnapshot> managerDocuments = managerQuery.documents;
    for (DocumentSnapshot managerDocument in managerDocuments) {
      stores.add(Manager.fromData(managerDocument.documentID, managerDocument.data));
    }
  }

}
