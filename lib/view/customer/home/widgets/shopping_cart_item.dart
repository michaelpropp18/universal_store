import 'package:flutter/material.dart';
import 'package:universal_store/models/cart_item.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItem item;
  final Function onDelete;
  final Function onIncrement;
  final Function onDecrement;

  const ShoppingCartItem(
      {this.item, this.onDelete, this.onIncrement, this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://picsum.photos/250?image=21',
              width: 70,
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.item.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$' + item.item.price.toStringAsFixed(2),
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 21,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: onDecrement,
                                child: Text('-',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                              ),
                              Text(item.quantity.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: onIncrement,
                                child: Text('+',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                              ),
                            ]),
                        decoration: new BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.rectangle,
                            // border: Border.all(width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: onDelete,
              child: Icon(
                Icons.delete,
                color: Colors.grey,
                size: 30.0,
              ),
            ),
          ],
        ));
  }
}
