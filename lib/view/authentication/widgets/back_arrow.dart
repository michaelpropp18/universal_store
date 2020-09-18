import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final Function onSubmitted;

  const BackArrow({this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 10),
      child: GestureDetector(
        onTap: () {
          if (onSubmitted != null) {
            onSubmitted();
          }
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
