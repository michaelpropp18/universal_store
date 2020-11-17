import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/routing/routing_constants.dart';
import 'package:universal_store/view/customer/shop/widgets/payment_input.dart';
import 'package:universal_store/view/shared/error_text.dart';

import 'package:universal_store/utilities.dart' as utilities;

class CheckoutPaymentScreen extends StatefulWidget {
  final Cart cart;

  const CheckoutPaymentScreen({this.cart});

  @override
  _CheckoutPaymentScreenState createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  String name;
  String number;
  String date;
  String code;
  String zip;
  String error;

  @override
  void initState() {
    name = '';
    number = '';
    date = '';
    code = '';
    zip = '';
    error = utilities.generateAllCardErrors(name, number, date, code, zip);
    super.initState();
  }

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
                  text: '\$' + widget.cart.total.toStringAsFixed(2),
                ),
                PaymentInput(
                  title: 'Name on card',
                  hintText: 'John Doe',
                  onChanged: (e) {
                    setState(() {
                      name = e;
                      error = utilities.generateAllCardErrors(
                          name, number, date, code, zip);
                    });
                  },
                ),
                PaymentInput(
                  title: 'Card number',
                  hintText: '1234 5678 9000 0000',
                  onChanged: (e) {
                    setState(() {
                      number = e;
                      error = utilities.generateAllCardErrors(
                          name, number, date, code, zip);
                    });
                  },
                ),
                Row(
                  children: [
                    PaymentInput(
                      title: 'Expiry date',
                      hintText: 'MM/YY',
                      onChanged: (e) {
                        setState(() {
                          date = e;
                          error = utilities.generateAllCardErrors(
                              name, number, date, code, zip);
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    PaymentInput(
                      title: 'Security Code',
                      hintText: '123',
                      onChanged: (e) {
                        setState(() {
                          code = e;
                          error = utilities.generateAllCardErrors(
                              name, number, date, code, zip);
                        });
                      },
                    ),
                  ],
                ),
                PaymentInput(
                  title: 'ZIP / Postal code',
                  hintText: '12345',
                  onChanged: (e) {
                    setState(() {
                      zip = e;
                      error = utilities.generateAllCardErrors(
                          name, number, date, code, zip);
                    });
                  },
                ),
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
                      onPressed: error == ''
                          ? () => Navigator.pushNamed(context, ReceiptRoute,
                              arguments: widget.cart)
                          : null,
                    ),
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
                ErrorText(error),
              ],
            ),
          )),
        ));
  }
}
