import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
            child: SpinKitFadingCube(
              color: Colors.white,
          size: 80.0,
        )),
      ],
    );
  }
}
