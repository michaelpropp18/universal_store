import 'package:flutter/material.dart';
import 'package:universal_store/models/cart.dart';
import 'package:universal_store/models/current_user.dart';
import 'package:universal_store/routing/routing_constants.dart';

class CheckoutBottom extends StatelessWidget {
  final Cart cart;

  const CheckoutBottom({this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      height: 240,
      child: Column(
        children: [
          Divider(
            thickness: 2,
            height: 2,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sub-total:',
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
            ],
          ),
          Align(
            child: Text(
                cart == null
                    ? '+ Processing Fee: '
                    : '+ Processing Fee: \$' +
                        cart.processingFee.toStringAsFixed(2),
                style: TextStyle(color: Colors.black87)),
            alignment: Alignment.centerLeft,
          ),
          Align(
            child: Text(
              cart == null
                  ? '+ Tax: '
                  : '+ Tax: \$' + cart.tax.toStringAsFixed(2),
              style: TextStyle(color: Colors.black87),
            ),
            alignment: Alignment.centerLeft,
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total:',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  cart == null ? '' : '\$' + cart.total.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ]),
              Spacer(flex: 3),
            ],
          ),
          Spacer(),
          Container(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  child: Text(
                    'Go to Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.white70)),
                  color: Colors.blue,
                  disabledColor: Colors.grey,
                  onPressed: () {
                    return Navigator.pushNamed(context, CheckoutPaymentRoute,
                        arguments: cart);
                  }),
            ),
          ),
          GestureDetector(
            onTap: () async {
              //await CurrentUser.user.deleteCart(cart);
              Navigator.pop(context);
            },
            child: Text('Continue Shopping'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
