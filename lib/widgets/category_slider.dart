import 'package:flutter/material.dart';
import 'package:food_order_app/pages/category_menu.dart';
import 'package:food_order_app/providers/meal_providers.dart';
import 'package:provider/provider.dart';

class CategorySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category =
        Provider.of<MealItemsProvider>(context, listen: false).category;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: category[i].color,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    category[i].title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CategoryMenu.routeName, arguments: {
                    'id' : category[i].id,
                    'title': category[i].title,
                  });
                },
              );
            }),
      ),
    );
  }
}
