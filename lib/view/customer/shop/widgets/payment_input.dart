import 'package:flutter/material.dart';

class PaymentInput extends StatelessWidget {
  final String title;
  final String hintText;
  final String text;

  const PaymentInput({this.title = '', this.hintText = '', this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5),
        height: 75,
        child: Column(
          children: [
            Align(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            if (text == '')
              TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  hintText: hintText,
                ),
              )
            else
              Align(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 32),
                ),
                alignment: Alignment.centerLeft,
              ),
          ],
        ),
      ),
    );
  }
}
