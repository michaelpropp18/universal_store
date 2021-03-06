import 'package:flutter/material.dart';

class SaveChangesButton extends StatelessWidget {
  final bool enabled;
  final Function onPress;
  final String text;

  const SaveChangesButton({@required this.enabled, @required this.onPress, this.text = 'Save'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: FlatButton(
          child: Text(
            text,
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
          onPressed: !enabled
              ? null
              : () {
                  onPress();
                },
        ),
      ),
    );
  }
}
