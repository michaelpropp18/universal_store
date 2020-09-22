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
                  header: 'My stummy hurts',
                  text: 'John from Legal says we are not allowed to tell you to take some tums but...',
                  route: null,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'My refrigerator is broken',
                  text: 'Oh we know :)',
                  route: null,
                  showEditIcon: false,
                ),
                Attribute(
                  header: 'How do I use the internet?',
                  text: 'Please delete our app',
                  route: null,
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
