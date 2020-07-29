import 'package:flutter/material.dart';
import 'package:meal/Widgets/meal_Item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  //since we want to cahnge the meals which we display hence convertion to stateful widget
  static const routeName = '/Category-Meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> CategoryMeals;
  String CategoryTitle;
  bool loadedInitData = false;

  @override
  void didChangeDependencies() {
    //important
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      CategoryTitle = routeArgs['title'];
      final CategoryId = routeArgs['id'];
      CategoryMeals = widget.availableMeals.where((Meals) {
        //Filtering the meals based on the category ID and storing as a list in Category Meals
        return Meals.categories.contains(
            CategoryId); //where is used as a conditional satetment with categories and contains as a helper
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(String mealID) {
    setState(() {
      CategoryMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            duration: CategoryMeals[index].duration,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
