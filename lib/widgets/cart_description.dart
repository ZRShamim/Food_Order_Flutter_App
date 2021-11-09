import 'package:flutter/material.dart';

class CartDescription extends StatelessWidget {
  final String _description;
  final String _value;

  CartDescription(this._description, this._value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _description,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          _value,
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
