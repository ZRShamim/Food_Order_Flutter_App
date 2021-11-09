import 'package:flutter/material.dart';
import 'package:food_order_app/providers/cart_providers.dart';
import 'package:food_order_app/theme/colors.dart';
import 'package:food_order_app/widgets/cart_description.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  static const routeName = '/food_details';

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final mealData = ModalRoute.of(context)!.settings.arguments as Map;
    final mealId = mealData['id'];
    final mealTitle = mealData['title'];
    final mealPrice = mealData['price'];
    final mealImg = mealData['imgUrl'];
    final mealDescription = mealData['description'];

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: Column(
        children: [
          Text(
            mealTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: Text(
              mealDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w300, color: lightBlack),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Image.network(
            mealImg,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: red, borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () => setState(() {
                          _count -= 1;
                          if (_count < 0) {
                            _count = 0;
                          }
                        }),
                    icon: const Icon(Icons.remove)),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                _count.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: red, borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () => setState(() {
                          _count += 1;
                        }),
                    icon: const Icon(Icons.add)),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartDescription('Base Price', mealPrice.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      CartDescription('Quantity', 'x${_count.toString()}'),
                      const SizedBox(
                        height: 15,
                      ),
                      CartDescription('Total Price', '${_count * mealPrice}'),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: redAccent,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {
                      if (_count > 0) {
                        cart.addItem(
                            mealId, mealPrice, mealTitle, _count, mealImg);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('$_count $mealTitle added'),
                          duration: const Duration(seconds: 2),
                        ));
                        setState(() {
                          _count = 0;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text('${cart.itemOrdered(mealId)} $mealTitle ordered'),
        ],
      ),
    );
  }
}
