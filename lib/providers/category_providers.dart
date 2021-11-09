import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color? color;

  Category({required this.id, required this.title, required this.color});
}

class CategoryItemsProviders with ChangeNotifier{
  final categories = [
    Category(
      id: 'c1',
      title: 'Spicey',
      color: Colors.red,
    ),
    Category(
      id: 'c2',
      title: 'Classic',
      color: Colors.orangeAccent,
    ),
    Category(
      id: 'c3',
      title: 'Vegeterian',
      color: Colors.green[800],
    ),
    Category(
      id: 'c4',
      title: 'Asian',
      color: Colors.grey,
    ),
    Category(
      id: 'c5',
      title: 'Indian',
      color: Colors.indigo,
    ),
    Category(
      id: 'c6',
      title: 'Fish and Seafood',
      color: Colors.blue,
    ),
    Category(
      id: 'c7',
      title: 'Desert',
      color: Colors.pink,
    ),
    Category(
      id: 'c8',
      title: 'Meat',
      color: Colors.redAccent[400],
    ),
    Category(
      id: 'c9',
      title: 'Chocolate',
      color: Colors.cyanAccent,
    ),
    Category(
      id: 'c10',
      title: 'Weastern',
      color: Colors.grey[350],
    ),
    Category(
      id: 'c11',
      title: 'Spicey',
      color: Colors.orange,
    ),
    Category(
      id: 'c12',
      title: 'Chinease',
      color: Colors.yellow,
    ),
    Category(
      id: 'c13',
      title: 'Breakfast',
      color: Colors.yellow,
    )
  ];
}