import 'package:flutter/material.dart';
//This file is the basic model of the items ti be included. It hold the very basic properties of all the items.

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
