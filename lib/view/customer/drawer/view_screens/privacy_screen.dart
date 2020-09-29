import 'package:flutter/material.dart';
import 'package:universal_store/view/manager/widgets/header_tab.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        title: Text('Privacy', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'The Universal Store collects a variety of information that you provide to us directly. We process your information when necessary to provide you with the Services that you have requested when accepting our Terms of Service.',
                //textAlign: TextAlign.justify,
                maxLines: 50,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          )),
    );
  }
}
