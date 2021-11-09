import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/user_button.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
