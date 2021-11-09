import 'package:flutter/material.dart';
import 'package:food_order_app/providers/meal_providers.dart';
import 'package:food_order_app/theme/colors.dart';
import 'package:food_order_app/widgets/food_details.dart';
import 'package:provider/provider.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealItemsProvider>(context).items;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mealData.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  mealData[i].imageUrl,
                  height: 150,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        mealData[i].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        mealData[i].description,
                        style: const TextStyle(
                            color: lightBlack, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          '${mealData[i].price} \$',
                          style: const TextStyle(
                              color: lightBlack, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () => Navigator.of(context)
                            .pushNamed(FoodDetails.routeName, arguments: {
                          'id': mealData[i].id,
                          'title': mealData[i].title,
                          'price': mealData[i].price,
                          'imgUrl': mealData[i].imageUrl,
                          'description': mealData[i].description,
                        }),
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 35,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
