import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  final bool error;
  final String text;
  final String hintText;
  final Function onChanged;
  final int maxLines;

  const EditField({this.error = false, this.text = '', this.hintText = '', this.onChanged, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: error ? Colors.red : Colors.black38,
          width: 1,
        ),
      ),
      height: 50.0 + (maxLines - 1) * 20,
      child: TextFormField(
        autofocus: true,
        style: TextStyle(
          color: Colors.black,
        ),
        initialValue: text,
        onChanged: (e) {
          if (onChanged != null) {
            onChanged(e);
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(14.0),
          hintText: hintText,
        ),
      ),
    );
  }
}
