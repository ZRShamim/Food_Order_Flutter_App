import 'package:flutter/material.dart';
import 'package:food_order_app/theme/colors.dart';

class ProfileButton extends StatelessWidget {
  final String name;

  const ProfileButton(this.name);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          height: 42,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, color: black),
            ),
          ),
        ));
  }
}
