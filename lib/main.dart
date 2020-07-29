import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screen/filter_Screen.dart';
import './screen/tabs_screen.dart';
import './screen/meal_screen_details.dart';
import './screen/category_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'Vegetarian': false
  }; //initializing all filters here
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void setFilters(
      Map<String, bool>
          filterData) //Function which will set the filters or save the filters for operation
  {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final expectedIndex =
        _favouriteMeals.indexWhere((Meal) => mealId == Meal.id);
    if (expectedIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(expectedIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((Meal) => mealId == Meal.id));
      });
    }
  }

  bool isMealFavourite(String mealID) {
    return _favouriteMeals.any((meal) =>
        mealID ==
        meal.id); //return true if any meal with the specific meal ID is found
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      home: TabsScreen(
          _favouriteMeals), //this is the entry point of the the app means the first screen which will appear when app starts.
      routes: {
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavourite, isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
      },
    );
  }
}

//An important point to remember is that all the screen we render always have a body and appbar. So it is very important to return
//scaffold
