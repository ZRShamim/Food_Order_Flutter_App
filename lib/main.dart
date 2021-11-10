import 'package:flutter/material.dart';
import 'package:food_order_app/pages/cart_page.dart';
import 'package:food_order_app/pages/category_menu.dart';
import 'package:food_order_app/pages/home_page.dart';
import 'package:food_order_app/pages/meal_list_page.dart';
import 'package:food_order_app/pages/orders_page.dart';
import 'package:food_order_app/providers/cart_providers.dart';
import 'package:food_order_app/providers/meal_providers.dart';
import 'package:food_order_app/providers/order_provider.dart';
import 'package:food_order_app/widgets/food_details.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MealItemsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrdersProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ghapa Ghap',
          home: HomePage(),
          routes: {
            FoodDetails.routeName: (ctx) => FoodDetails(),
            CartPage.routeName: (ctx) => CartPage(),
            CategoryMenu.routeName: (ctx) => CategoryMenu(),
            OrdersPage.routName: (ctx) => OrdersPage()
          }),
    );
  }
}
