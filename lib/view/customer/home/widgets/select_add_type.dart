import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

class SelectAddType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SelectStoreRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.shopping_cart, size: 30),
                    ),
                    Text('Shopping Trip', style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SelectPreviousShoppingTrip);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                    Text('Item', style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
