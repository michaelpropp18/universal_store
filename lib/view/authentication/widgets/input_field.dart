import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class InputField extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focus;
  final bool error;
  final TextInputType textInputType;
  final IconData icon;
  final String hintText;
  final bool obscureText;

  const InputField(
      {@required this.textController,
      @required this.focus,
      @required this.error,
      @required this.icon,
      this.textInputType: TextInputType.text,
      this.hintText: '',
      this.obscureText: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: error ? Colors.red : Colors.black38,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 50.0,
      child: TextField(
        focusNode: focus,
        controller: textController,
        keyboardType: textInputType,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            icon,
            color: Colors.white70,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
