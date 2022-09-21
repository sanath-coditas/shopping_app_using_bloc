import 'package:flutter/material.dart';
import 'package:shopping_app_assignment/constants.dart';
import 'package:shopping_app_assignment/screens/home_screen.dart';

import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.network(
              'https://unblast.com/wp-content/uploads/2021/01/T-shirt-Set-on-Hanger-Mockup-2-scaled.jpg'),
          ListTile(
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text(
                'SHOPPING',
                style: kshoppingHeadingStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              }),
          kcustomDivider,
          ListTile(
              leading: const Icon(
                Icons.payment,
                size: 30,
              ),
              title: const Text(
                'CART',
                style: kshoppingHeadingStyle,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen()));
              }),
          kcustomDivider,
          ListTile(
              leading: const Icon(
                Icons.history,
                size: 30,
              ),
              title: const Text(
                'ORDERS',
                style: kshoppingHeadingStyle,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrdersScreen()));
              }),
          kcustomDivider,
        ],
      ),
    );
  }
}
