import 'package:flutter/material.dart';

class HeaderTab extends StatelessWidget {
  final IconData icon;
  final String title;

  const HeaderTab({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 110,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
          ),
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 50,
                child: Icon(
                  icon,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
