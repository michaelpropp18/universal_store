import 'package:flutter/material.dart';

class SearchCategoryButton extends StatelessWidget {
  final String text;

  const SearchCategoryButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(text, style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {},
      ),
    );
  }
}
