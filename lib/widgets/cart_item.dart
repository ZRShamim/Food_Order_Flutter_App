import 'package:flutter/material.dart';
import 'package:food_order_app/providers/cart_providers.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  late int quantity;
  final String title;
  final String imgUrl;

  CartItem(
      {required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imgUrl});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // var _ordered = widget.quantity;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: GestureDetector(
        onTap: () => setState(() {
          _expanded = !_expanded;
          if (_expanded == false) {
            cart.addItemFromCart(widget.productId, widget.price, widget.title,
                widget.quantity, widget.imgUrl);
          }
          if (widget.quantity == 0) {
            cart.removeItem(widget.productId);
          }
        }),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                widget.imgUrl,
              ),
              title: Text(widget.title),
              subtitle: Text('Total: \$${widget.price * widget.quantity}'),
              trailing: Text('${widget.quantity} x'),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '\$${widget.price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Quantity',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () => setState(() {
                                          widget.quantity -= 1;
                                          if (widget.quantity < 0) {
                                            widget.quantity = 0;
                                          }
                                        }),
                                    icon: const Icon(Icons.remove)),
                                Text('x${widget.quantity}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                                IconButton(
                                    onPressed: () => setState(() {
                                          widget.quantity += 1;
                                        }),
                                    icon: const Icon(Icons.add))
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              )
          ],
        ),
      ),
    );
  }
}
