import 'package:flutter/material.dart';

class ShoppingCartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://picsum.photos/250?image=76',
              width: 80,
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leather chair',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$122.19',
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('-',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              Text('1',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('+',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
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
          ],
        ));
  }
}
