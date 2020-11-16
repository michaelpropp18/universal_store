import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';

class HiddenShoppingCartBottom extends StatelessWidget {
  final Function toggle;
  final Cart cart;

  const HiddenShoppingCartBottom({this.toggle, this.cart});

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
                  cart == null ? '' : '\$' + cart.subTotal.toStringAsFixed(2),
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
