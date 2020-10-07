import 'package:flutter/material.dart';

class ShoppingCartBottom extends StatelessWidget {
  final Function toggle;

  const ShoppingCartBottom({this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 220,
      child: Column(
        children: [
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
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
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 36.0,
                ),
              ),
            ],
          ),
          Align(
            child: Text('+ Processing Fee: \$2.98',
                style: TextStyle(color: Colors.black87)),
            alignment: Alignment.centerLeft,
          ),
          Align(
            child:
                Text('+ Tax: \$12.98', style: TextStyle(color: Colors.black87)),
            alignment: Alignment.centerLeft,
          ),
          Divider(thickness: 2,),
          Container(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  child: Text(
                    'Check Out',
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
                  onPressed: () {}),
            ),
          ),
          Text('Cancel Shopping Trip'),
          Spacer(),
        ],
      ),
    );
  }
}
