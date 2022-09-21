import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';
import 'package:shopping_app_assignment/constants.dart';
import 'package:shopping_app_assignment/screens/cart_screen.dart';
import 'package:shopping_app_assignment/widgets/badge.dart';
import 'package:shopping_app_assignment/widgets/drawer_widget.dart';

import '../widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: kbackgroundColor,
        appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: kheadingColor,
              ),
            ),
            elevation: 0,
            backgroundColor: kbackgroundColor,
            title: const Text(
              'Shopping',
              style: kshoppingHeadingStyle,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                color: kprimaryColor,
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              BlocBuilder<ProductDataBloc, ProductDataState>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    return Badge(
                      value: (state).cartProducts.length.toString(),
                      color: kprimaryColor,
                      child: IconButton(
                        color: kprimaryColor,
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          BlocProvider.of<ProductDataBloc>(context)
                              .add(CartScreenNavigateEvent());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                        },
                      ),
                    );
                  }
                  return Badge(
                    value: '0',
                    color: kprimaryColor,
                    child: IconButton(
                      color: kprimaryColor,
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                        BlocProvider.of<ProductDataBloc>(context)
                            .add(CartScreenNavigateEvent());
                      },
                    ),
                  );
                },
              ),
            ]),
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              SizedBox(
                width: double.infinity,
                child: Text('Fashion', style: kheadingStyle),
              ),
              SizedBox(height: 16),
              ProductList()
            ],
          ),
        ));
  }
}
