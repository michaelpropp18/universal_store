import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          child: Text(
            'Promotions',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Items',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Stores',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
