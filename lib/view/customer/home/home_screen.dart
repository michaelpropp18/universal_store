import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/home/browse/home_browse.dart';
import 'package:universal_store/view/customer/home/widgets/select_add_type.dart';

//import '../../../services/auth.dart';
import 'carts/home_carts_screen.dart';
import '../drawer/drawer.dart';
import 'widgets/search.dart';
import 'widgets/tabs.dart';

class Home extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // number of tabs
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
        body: TabBarView(
          children: [HomeStoresScreen(), HomeCartsScreen()],
        ),
        drawer: CustomerDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SelectAddType(),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
