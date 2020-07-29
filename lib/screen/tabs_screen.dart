import 'package:flutter/material.dart';
import '../main_drawer.dart';
import '../models/meal.dart';
import '../screen/favourite_screen.dart';
import '../screen/category_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>
      pages; //widget is not vaialble in state initially so we need to initialize state in initStaqte() function.
  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favourites'
      },
    ];
    super.initState();
  }

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
