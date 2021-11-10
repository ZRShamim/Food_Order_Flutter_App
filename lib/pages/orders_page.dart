import 'package:flutter/material.dart';
import 'package:food_order_app/providers/order_provider.dart';
import 'package:food_order_app/widgets/app_drawer.dart';
import 'package:food_order_app/widgets/order_list.dart';
import 'package:provider/provider.dart';


class OrdersPage extends StatelessWidget {
  static const routName = '/orders-page';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer:  AppDrawer(),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (ctx, i) => OrderItemList(ordersData.orders[i])),
    );
  }
}