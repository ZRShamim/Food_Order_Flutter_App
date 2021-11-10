import 'package:flutter/material.dart';
import 'package:food_order_app/pages/home_page.dart';
import 'package:food_order_app/pages/orders_page.dart';
import 'package:food_order_app/widgets/user_button.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.redAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10),
                  child: SafeArea(
                      child: Text(
                    'Welcome',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    ProfileButton('LogIn'),
                    ProfileButton('Register')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text('Food Menu',
                style: TextStyle(
                  fontSize: 24
                ),
              )
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(OrdersPage.routName);
              },
              child: const Text('Orders',
                style: TextStyle(
                  fontSize: 24
                )
              )
          )
        ],
      ),
    );
  }
}
