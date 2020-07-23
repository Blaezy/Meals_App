import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String url;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  void SelectMeal() {}

  MealItem({
    @required this.title,
    @required this.url,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: SelectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                     ,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
