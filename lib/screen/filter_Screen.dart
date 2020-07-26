import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filter-Screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildListswitch(
      String title, String subtitle, bool value, Function updater) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updater);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Meals'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meals Here',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildListswitch(
                    'Gluten Free', 'Will Show Gluten Free Meals', glutenFree,
                    (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                buildListswitch('Veg', 'Will show vegetarian Meals', vegetarian,
                    (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                buildListswitch('Vegan', 'Will show Vegan Meals', vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
                buildListswitch(
                    'Lactose Free', 'Will show Lactose Free Meals', lactoseFree,
                    (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
