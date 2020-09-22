import 'package:flutter/material.dart';
import 'package:universal_store/view/customer/home/widgets/search_category_button.dart';

import 'widgets/store_card.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light, // this makes the status bar black
        iconTheme: new IconThemeData(
            color: Colors.black), // this changes color of hamburger icon
        backgroundColor: Colors.white,
        //title: Text('Search Page', style: TextStyle(color: Colors.black)),
        title: TextField(),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SearchCategoryButton(text: 'Stores'),
                SearchCategoryButton(text: 'Items'),
                SearchCategoryButton(text: 'Promotions'),
                SearchCategoryButton(text: 'Category 1'),
                SearchCategoryButton(text: 'Category 2'),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
              children: List.generate(10, (index) {
                return SearchCard(number: index + 70);
              }),
            ),
          ),
          /*
          Container(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 5),
              separatorBuilder: (context, index) => Divider(color: Colors.grey),
              shrinkWrap: true,
              itemCount: Stores.stores.length,
              itemBuilder: (context, index) {
                return CartTab(
                  icon: Icons.store,
                  storeName: Stores.stores[index].name,
                );
              },
            ),
          ),
          */
        ],
      ),
    );
  }
}
