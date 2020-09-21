import 'package:flutter/material.dart';

class StoreAttribute extends StatelessWidget {
  final String header;
  final String text;
  final String route;

  const StoreAttribute(
      {@required this.text, @required this.header, @required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 75, // TODO fix this
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
          //IconButton(icon: Icon(Icons.chevron_right), onPressed: () {  },)
          GestureDetector(
            //child: Icon(Icons.chevron_right),
            child: Icon(Icons.edit),
            onTap: () {
              Navigator.pushNamed(context, route);
            },
          )
        ],
      ),
    );
  }
}
