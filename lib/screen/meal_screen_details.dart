import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
        appBar: AppBar(title: Text('Meal Details')),
        body: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double,
                child: Image.network(SelectedMeal.imageUrl)),
          ],
        ));
  }
}
