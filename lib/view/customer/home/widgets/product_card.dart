import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int number;

  const ProductCard({this.number = 9});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Image.network(
                'https://picsum.photos/250?image=' + number.toString(),
                height: 200,
                width: 200,
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Text('Product ' + number.toString(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          ],
        ));
  }
}
