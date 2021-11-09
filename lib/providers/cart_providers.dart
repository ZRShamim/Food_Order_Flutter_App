import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imgUrl;

  Cart(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imgUrl});
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> items = {};

  int get itemCount {
    return items.isEmpty ? 0 : items.length;
  }

  double get totalAmount {
    var total = 0.0;
    items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItemFromCart(String productId, double price, String title,
      int quantity, String imgUrl) {
    if (items.containsKey(productId)) {
      items.update(
          productId,
          (existingValue) => Cart(
              id: existingValue.id,
              title: existingValue.title,
              price: existingValue.price,
              imgUrl: existingValue.imgUrl,
              quantity: quantity));
    }
    notifyListeners();
  }

  void addItem(String productId, double price, String title, int quantity,
      String imgUrl) {
    if (items.containsKey(productId)) {
      items.update(
          productId,
          (existingValue) => Cart(
              id: existingValue.id,
              title: existingValue.title,
              price: existingValue.price,
              imgUrl: existingValue.imgUrl,
              quantity: existingValue.quantity + quantity));
    } else {
      items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imgUrl: imgUrl,
              quantity: quantity));
    }
    notifyListeners();
  }

  itemOrdered(String productId) {
    if (items.containsKey(productId)) {
      return items[productId]!.quantity;
    }
    return 0;
  }

  void removeItem(String mealId) {
    items.remove(mealId);
    notifyListeners();
  }

  void clear() {
    items = {};
    notifyListeners();
  }
}
