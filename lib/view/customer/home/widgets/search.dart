import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 10,
      ),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[
              Text(
                "Search here",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
