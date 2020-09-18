import 'package:flutter/material.dart';

import 'store_attribute.dart';

class StoreAttributeBox extends StatelessWidget {

  final String header;
  final List<StoreAttribute> storeAttributes;

  const StoreAttributeBox({@required this.storeAttributes, @required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              header,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.black26,
            height: 5,
            thickness: 2,
          ),
          ... storeAttributes,
        ],
      ),
    );
  }
}
