import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          child: Text(
            'Browse',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Carts',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
