import 'package:flutter/material.dart';
import 'package:meal/main_drawer.dart';
import '../screen/favourite_screen.dart';
import '../screen/category_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Your Favourites'},
  ];
  var SelectedPageIndex = 0;

  void Selectpage(int index) {
    setState(() {
      SelectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[SelectedPageIndex]['title']),
      ),
      body: pages[SelectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: Selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:
            SelectedPageIndex, //important for feeding information regarding which tab is selected
        type: BottomNavigationBarType.shifting, //for slight animation
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.schedule),
              title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favourites'))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
