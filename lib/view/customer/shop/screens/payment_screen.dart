import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/shop/widgets/payment_input.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Confirm Payment', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              child: Column(
            children: [
              PaymentInput(
                title: 'Payment Amount',
                text: '\$12.99',
              ),
              PaymentInput(
                title: 'Name on card',
                hintText: 'John Doe',
              ),
              PaymentInput(
                  title: 'Card number', hintText: '1234 5678 9000 0000'),
              Row(
                children: [
                  PaymentInput(title: 'Expiry date', hintText: 'MM/YY'),
                  SizedBox(width: 10),
                  PaymentInput(title: 'Security Code', hintText: '123'),
                ],
              ),
              PaymentInput(title: 'ZIP / Postal code', hintText: '12345'),
              Container(
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                      child: Text(
                        'Confirm Payment',
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
                      onPressed: () {}),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  //await CurrentUser.user.deleteCart(cart);
                  Navigator.pop(context);
                },
                child: Text('Return to Checkout'),
              ),
            ],
          )),
        ));
  }
}
