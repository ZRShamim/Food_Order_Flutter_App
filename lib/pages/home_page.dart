import 'package:flutter/material.dart';
import 'package:food_order_app/pages/cart_page.dart';
import 'package:food_order_app/theme/colors.dart';
import 'package:food_order_app/widgets/app_drawer.dart';
import 'package:food_order_app/widgets/category_slider.dart';
import 'package:food_order_app/widgets/menu_list.dart';
import 'package:food_order_app/widgets/popular_dish.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Z Food',
          style: TextStyle(color: black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.98,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SearchBar(),
              CategorySlider(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Popular Dishes',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PopularDish(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Our Menu',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              MenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
