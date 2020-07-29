import 'package:flutter/material.dart';
import '../screen/meal_screen_details.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String url;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  String get ComplexityTest {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'UNknown';
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      default:
        return 'Unknown';
    }
  }

  void SelectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      //then function is executed everytime the above screen is popped so there are two ways of pooping screen one normally
      //when back button is pressed and at that time since no data is passed along result will be null while other way of popping is through
      //trash icon at that time meal ID is passed hence result mealID will be printed.
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  MealItem({
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
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
                    url,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //special widget which works only in stack to positon the child element
                  bottom: 20, //20px from bottom
                  right: 10, //10 px from right
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 26,
                          color: Colors.white),
                      softWrap: true, //Wrapping Contents inside the area
                      overflow: TextOverflow.fade, //fade text if overflowed
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(ComplexityTest)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(AffordabilityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
