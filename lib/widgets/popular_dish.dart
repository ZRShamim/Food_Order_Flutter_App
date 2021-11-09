import 'package:flutter/material.dart';
import 'package:food_order_app/providers/meal_providers.dart';
import 'package:food_order_app/theme/colors.dart';
import 'package:provider/provider.dart';

import 'food_details.dart';

class PopularDish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealItem = Provider.of<MealItemsProvider>(context, listen: false);
    final cat = mealItem.showCategory('c1');
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealItem.popularItems.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 300,
              color: lightGrey,
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(FoodDetails.routeName, arguments: {
                          'id': mealItem.popularItems[i].id,
                          'title': mealItem.popularItems[i].title,
                          'price': mealItem.popularItems[i].price,
                          'imgUrl': mealItem.popularItems[i].imageUrl,
                          'description': mealItem.popularItems[i].description,
                        }),
                        child: Image.network(
                          mealItem.popularItems[i].imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 120,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealItem.popularItems[i].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${mealItem.popularItems[i].price} tk',
                              style: const TextStyle(fontSize: 17),
                            ),
                            Container(
                              // height: 30,
                              decoration: BoxDecoration(
                                  // color: mealItem.popularItems[i].category.map((i) => null),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mealItem.popularItems[i].category
                                    .map((cat) => cat)
                                    .toString()),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
