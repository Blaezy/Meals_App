import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import '../Widgets/meal_Item.dart';

class FavouriteScreen extends StatelessWidget {
  List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favorites Start adding Some!!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            url: favouriteMeals[index].imageUrl,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
