import 'package:flutter/material.dart';
import './category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home:
          CategoryScreen(), //this is the entry point of the the app means the first screen which will appear when app starts.
    );
  }
}

//An important point to remember is that all the screen we render always have a body and appbar. So it is very important to return
//scaffold
