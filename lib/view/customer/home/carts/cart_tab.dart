import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  final String storeName;
  final IconData icon;

  const CartTab({@required this.storeName, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              )),
          Container(
            width: MediaQuery.of(context).size.width - 110, // TODO fix this
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SelectableText(
                  'Store Description',
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
            onTap: () {
              print('got here');
              /*
              Navigator.pushNamed(
                context,
                ManagerInventoryItemRoute,
                arguments: uid,
              );
              */
            },
          )
        ],
      ),
    );
  }
}
