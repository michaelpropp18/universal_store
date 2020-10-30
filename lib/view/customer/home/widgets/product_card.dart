import 'package:flutter/material.dart';
import 'package:universal_store/models/item.dart';
import 'package:universal_store/models/manager.dart';
import 'package:universal_store/routing/routing_constants.dart';

class ProductCard extends StatelessWidget {
  final Item item;
  final int number;

  const ProductCard({this.item, this.number});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ViewProductRoute, arguments: item),
      child: Container(
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
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image.network(
                  'https://picsum.photos/250?image=21',
                  height: 200,
                  width: 200,
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(item.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )),
            ],
          )),
    );
  }
}
