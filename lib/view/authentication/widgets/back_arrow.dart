import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
