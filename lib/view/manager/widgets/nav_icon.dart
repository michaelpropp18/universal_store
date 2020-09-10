import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const NavIcon({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          IconButton(
            iconSize: 70,
            icon: Icon(icon),
            onPressed: () {},
          ),
          Text(text),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
