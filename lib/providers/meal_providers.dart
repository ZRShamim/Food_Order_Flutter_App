import 'package:flutter/material.dart';

class MealItem with ChangeNotifier {
  final String id;
  final double price;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> category;
  bool isFavorite;
  final bool isPopular;

  MealItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
    required this.isPopular,
  });

  void toggleFavoriteStatuss() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Category {
  final String id;
  final String title;
  final Color? color;

  Category({required this.id, required this.title, required this.color});
}

class MealItemsProvider with ChangeNotifier {
  final category = [
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

  final List<MealItem> _items = [
    MealItem(
        id: 'm1',
        title: 'Lamb Burger',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 140,
        imageUrl:
            'https://www.themealdb.com/images/media/meals/k420tj1585565244.jpg',
        category: ['c1', 'c8'],
        isPopular: true),
    MealItem(
        id: 'm2',
        title: 'Chocolate Raspberry Brownies',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 180,
        imageUrl:
            'https://www.themealdb.com/images/media/meals/yypvst1511386427.jpg',
        category: ['c7', 'c9', 'c2', 'c4'],
        isPopular: true),
    MealItem(
        id: 'm3',
        title: 'Beef stroganoff',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 280,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//svprys1511176755.jpg',
        category: ['c4', 'c8', 'c2'],
        isPopular: true),
    MealItem(
        id: 'm4',
        title: 'Chicken & mushroom Hotpot',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 250,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//uuuspp1511297945.jpg',
        category: ['c1', 'c8'],
        isPopular: true),
    MealItem(
        id: 'm5',
        title: 'Salted Caramel Cheescake',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 180,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//xqrwyr1511133646.jpg',
        category: ['c7', 'c10', 'c9'],
        isPopular: true),
    MealItem(
        id: 'm6',
        title: 'Salted Caramel Cheescake',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 260,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//1529443236.jpg',
        category: ['c8', 'c1'],
        isPopular: false),
    MealItem(
        id: 'm7',
        title: 'Pancakes',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 130,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//rwuyqx1511383174.jpg',
        category: ['c13', 'c7', 'c2'],
        isPopular: false),
    MealItem(
        id: 'm8',
        title: 'Leblebi Soup',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 230,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//x2fw9e1560460636.jpg',
        category: ['c11', 'c12', 'c5'],
        isPopular: false),
    MealItem(
        id: 'm9',
        title: 'Meat Kofta',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: 230,
        imageUrl:
            'https://www.themealdb.com//images//media//meals//wqurxy1511453156.jpg',
        category: ['c1', 'c12'],
        isPopular: false),
  ];

  List<MealItem> get items {
    return [..._items];
  }

  List<MealItem> get popularItems {
    return [..._items.where((item) => item.isPopular == true)];
  }

  showCategory(String catId) {
    if (items.where((meal) => meal.category.contains(catId)).isEmpty) {
      return null;
    }
    return items.where((meal) => meal.category.contains(catId)).toList();
  }
}
