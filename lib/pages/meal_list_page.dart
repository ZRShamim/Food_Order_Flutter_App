import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/menu_list.dart';

class MealListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
      ),
      // body: ProductGrid(),
    );
  }
}