import 'package:flutter/material.dart';
import 'package:universal_store/routing/routing_constants.dart';

class StoreItem extends StatelessWidget {
  final String uid;
  final String name;
  final double price;
  final int quantity;
  final Function onUpdate;

  const StoreItem(
      {@required this.price,
      @required this.name,
      @required this.quantity,
      @required this.uid,
      this.onUpdate});

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
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SelectableText(
                  '\$' +
                      price.toStringAsFixed(2) +
                      ' (x' +
                      quantity.toString() +
                      ')',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Icon(Icons.chevron_right),
            onTap: () async {
              Navigator.pushNamed(context, ManagerInventoryItemRoute,
                      arguments: uid)
                  .then((_) {
                onUpdate();
              });
            },
          )
        ],
      ),
    );
  }
}
