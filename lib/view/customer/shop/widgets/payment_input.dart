import 'package:flutter/material.dart';

class PaymentInput extends StatelessWidget {
  final String title;
  final String hintText;
  final String text;
  final Function onChanged;

  const PaymentInput(
      {this.title = '', this.hintText = '', this.text = '', this.onChanged});

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
              Container(
                child: TextField(
                  onChanged: (i) {
                    if (this.onChanged != null) {
                      this.onChanged(i);
                    }
                  },
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    hintText: hintText,
                  ),
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
