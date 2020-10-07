import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/home/widgets/product_card.dart';

class ItemHeaderTab extends StatelessWidget {
  final IconData icon;
  final String title;

  const ItemHeaderTab({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    int number = 9;
    return Row(
      children: [
        SizedBox(width: 50),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://picsum.photos/250?image=' + number.toString()),
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
    /*
    return SizedBox(
      height: 150,
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        
        child: Image.network(
          'https://picsum.photos/250?image=' + number.toString(),
        ),
      ),
    );
    */
  }
}
