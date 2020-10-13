import 'package:flutter/material.dart';
import 'package:universal_store/view/shared/attribute.dart';
import 'package:universal_store/view/shared/attribute_box.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Help', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            AttributeBox(
              header: 'FAQ',
              attributes: [
                Attribute(
                  header: 'What is Universal Store?',
                  text: 'The Universal Store seeks to improve the experience of shoppers by providing a tool to skip the lines and pay from your finger-tips.',
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'How do I use Universal Store to shop at my favorite places?',
                  text: 'Select the + icon from the home screen. You will see a list of all your favorite store to shop. Once you scroll to find yours, select it and begin shopping!',
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'How do I add an item to my cart?',
                  text: 'Once you have found an item in the store you would like to purchase, find the barcode on packaging. Select "scan barcode" and you will aim your phone''s camera at the barcode. Once the Universal Store recognises your item it will put in in your cart automatically!',
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'How do I use Universal Store to pay for my items?',
                  text: 'In your settings, you can add your preferred payment method to pay for your shopping trips. At the end of your shopping trip you can select that payment method and you''re all set! If you want to add multiple payment methods you can do so the same way you set up the first.',
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'How can I be sure my payment information is secure with Universal Store',
                  text: 'Universal Store uses the 3rd party payment service Stripe (tm) trusted by companies like xxx and xxx.',
                  showEditIcon: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
