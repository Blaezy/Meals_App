import 'package:flutter/material.dart';
import '../screen/category_meal_screen.dart';
// This file is the widget which would be called for every single items to hold data on screen.

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  void SelectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //InkWELL implemented for the first time
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor, //Animation on tap
      borderRadius: BorderRadius.circular(
          15), //keep the border radius same as in the Container/Card created.
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                //Gradient Implementation for the first time.
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
