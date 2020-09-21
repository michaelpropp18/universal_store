import 'package:flutter/material.dart';

import 'store_item.dart';

class StoreInventoryBox extends StatelessWidget {
  final String header;
  final ListView inventoryItems;

  const StoreInventoryBox(
      {@required this.inventoryItems, @required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
            /*
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Text('test');
              },
            ),
            */
            inventoryItems,
            //... inventoryItems,
          ],
        ),
      ),
    );
  }
}
