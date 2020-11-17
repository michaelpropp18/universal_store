import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/home/widgets/checkout_item.dart';

class ReceiptScreen extends StatelessWidget {
  final Cart cart;

  const ReceiptScreen({this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                cart.store.storeName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                cart.store.storeAddress,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                'Phone: ' + cart.store.storePhone,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return CheckoutItem(item: cart.items[index]);
                  }),
            ),
            Text('***Show your receipt to clerk'),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              height: 220,
              child: Column(
                children: [
                  Divider(
                    thickness: 2,
                    height: 2,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sub-total:',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              cart == null
                                  ? ''
                                  : '\$' + cart.subTotal.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                          ]),
                    ],
                  ),
                  Align(
                    child: Text(
                        cart == null
                            ? '+ Processing Fee: '
                            : '+ Processing Fee: \$' +
                                cart.processingFee.toStringAsFixed(2),
                        style: TextStyle(color: Colors.black87)),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(
                      cart == null
                          ? '+ Tax: '
                          : '+ Tax: \$' + cart.tax.toStringAsFixed(2),
                      style: TextStyle(color: Colors.black87),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              cart == null
                                  ? ''
                                  : '\$' + cart.total.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                          ]),
                      Spacer(flex: 3),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                          child: Text(
                            'Go to Home Screen',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.white70)),
                          color: Colors.blue,
                          disabledColor: Colors.grey,
                          onPressed: () {
                            Navigator.pop(context);
                            /*
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomeRoute, (route) => false);
                                */
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
