import 'package:flutter/material.dart';

class Attribute extends StatelessWidget {
  final String header;
  final String text;
  final String route;
  final bool showEditIcon;
  final String uid;
  final Function onPressed;

  const Attribute(
      {@required this.text, @required this.header, @required this.route, this.showEditIcon = true, this.uid, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (showEditIcon) ? MediaQuery.of(context).size.width - 75 : MediaQuery.of(context).size.width - 50, // TODO fix this
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SelectableText(
                  text,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          if (showEditIcon)
          GestureDetector(
            child: Icon(Icons.edit),
            onTap: () {
              if (onPressed != null) {
                onPressed();
              }

              //Navigator.pushNamed(context, route, arguments: <String, double> {'originalPrice': 444});
            },
          )
        ],
      ),
    );
  }
}
