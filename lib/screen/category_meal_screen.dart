import 'package:flutter/material.dart';
import 'package:meal/Widgets/meal_Item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/Category-Meals';
  /* final String id;
  final String title;
  CategoryMealScreen(this.id, this.title);*/ //This is the first approach of Pushing the screen on top of another.

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where((Meals) {
      //Filtering the meals based on the category ID and storing as a list in Category Meals
      return Meals.categories.contains(
          CategoryId); //where is used as a conditional satetment with categories and contains as a helper
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: CategoryMeals[index].id,
              title: CategoryMeals[index].title,
              url: CategoryMeals[index].imageUrl,
              complexity: CategoryMeals[index].complexity,
              affordability: CategoryMeals[index].affordability,
              duration: CategoryMeals[index].duration);
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
