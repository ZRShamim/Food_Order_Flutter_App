import 'package:flutter/material.dart';
import 'package:food_order_app/providers/cart_providers.dart';
import 'package:food_order_app/providers/order_provider.dart';
import 'package:food_order_app/theme/colors.dart';
import 'package:food_order_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final order = Provider.of<OrdersProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        actions: [
          TextButton(
            onPressed: () {
              if (cart.totalAmount > 0) {
                order.addOrder(cart.items.values.toList(), cart.totalAmount);
                  cart.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add minimum one item to cart')));
              }
              },
              child: const Text('Order Now',
                style: TextStyle(
                  color: white,
                  fontSize: 20
                ),
              )
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items: ${cart.itemCount}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Cost: ${cart.totalAmount}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (ctx, i) => CartItem(
                        id: cart.items.values.toList()[i].id,
                        productId: cart.items.keys.toList()[i],
                        price: cart.items.values.toList()[i].price,
                        quantity: cart.items.values.toList()[i].quantity,
                        title: cart.items.values.toList()[i].title,
                        imgUrl: cart.items.values.toList()[i].imgUrl,
                      )))
        ],
      ),
    );
  }
}
