import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class InputField extends StatelessWidget {
  final FocusNode focus;
  final bool error;
  final TextInputType textInputType;
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final bool autofocus;
  final TextInputAction textInputAction;
  final Function onSubmitted;
  final Function onChanged;

  const InputField({
    this.focus,
    @required this.error,
    @required this.icon,
    this.textInputType: TextInputType.text,
    this.hintText: '',
    this.obscureText: false,
    this.autofocus: false,
    this.onSubmitted,
    this.textInputAction: TextInputAction.done,
    this.onChanged,
  });

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
        keyboardType: textInputType,
        textInputAction: textInputAction,
        autofocus: autofocus,
        style: TextStyle(
          color: Colors.white,
        ),
        onSubmitted: (e) {
          if (onSubmitted != null) {
            onSubmitted(e);
          }
        },
        onChanged: (e) {
          if (onChanged != null) {
            onChanged(e);
          }
        },
        
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
