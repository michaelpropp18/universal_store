import 'package:flutter/material.dart';

//import '../../../services/auth.dart';
import 'widgets/drawer.dart';
import 'widgets/search.dart';
import 'widgets/tabs.dart';

class Home extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Universal Store', style: TextStyle(color: Colors.black)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(115),
            child: Column(
              children: <Widget>[
                Search(),
                Tabs(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Shop'),
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            title: Text('Scan Item'),
            icon: Icon(Icons.photo_camera),
          )
        ]),
        drawer: CustomerDrawer(),
      ),
    );
  }
}
