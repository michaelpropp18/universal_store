import 'package:flutter/material.dart';

class HiddenShoppingCartBottom extends StatelessWidget {
  final Function toggle;

  const HiddenShoppingCartBottom({this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      child: Column(
        children: [
          Divider(
            thickness: 2,
            height: 2,
            color: Colors.black,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sub total:',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  '\$123.13',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ]),
              Spacer(),
              GestureDetector(
                onTap: toggle,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 36.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
