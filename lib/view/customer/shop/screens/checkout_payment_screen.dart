import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/shop/widgets/payment_input.dart';
import 'package:universal_store/view/shared/error_text.dart';

class CheckoutPaymentScreen extends StatelessWidget {
  final Cart cart;

  const CheckoutPaymentScreen({this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Confirm Payment', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/credit_cards.png',
                  height: 60,
                ),
                PaymentInput(
                  title: 'Payment Amount',
                  text: '\$' + cart.total.toStringAsFixed(2),
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
                        onPressed: () {
                          Navigator.pushNamed(context, ReceiptRoute, arguments: cart);
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      //await CurrentUser.user.deleteCart(cart);
                      Navigator.pop(context);
                    },
                    child: Text('Return to Checkout'),
                  ),
                ),
                ErrorText('Error Message Here'),
              ],
            ),
          )),
        ));
  }
}
