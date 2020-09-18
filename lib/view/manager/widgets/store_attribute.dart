import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

class StoreAttribute extends StatelessWidget {
  final String header;
  final String text;

  const StoreAttribute({@required this.text, @required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300, // TODO make this guy dynamic based on phone size
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
            child: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, ManagerEditStoreFieldRoute);
            },
          )
        ],
      ),
    );
  }
}
