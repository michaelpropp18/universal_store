import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/submit_button.dart';
import 'package:universal_store/view/customer/shop/widgets/payment_input.dart';
import 'package:universal_store/view/shared/edit_field.dart';

import 'package:universal_store/utilities.dart' as utilities;
import 'package:universal_store/view/shared/error_text.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
        backgroundColor: Color.fromARGB(0xFF, 0xDC, 0xDC, 0xDC),
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Save Payment', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/credit_cards.png',
                  height: 60,
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
                        'Save Payment Information',
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
                      onPressed:
                          error == '' ? () => Navigator.pop(context) : null,
                    ),
                  ),
                ),
                ErrorText(error),
              ],
            ),
          )),
        ));
  }
}
