import 'package:flutter/material.dart';

class BrowseHeader extends StatelessWidget {
  final String text;

  const BrowseHeader({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('Category: Retail'),
            ],
          ),
          SizedBox(
            width: 70,
            height: 30,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Shop',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
