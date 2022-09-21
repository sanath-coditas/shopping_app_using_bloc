import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';
import 'package:shopping_app_assignment/constants.dart';
import 'package:shopping_app_assignment/screens/orders_screen.dart';
import 'package:shopping_app_assignment/widgets/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProductDataBloc>(context),
      child: BlocBuilder<ProductDataBloc, ProductDataState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kbackgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: kbackgroundColor,
              leading: IconButton(
                color: kheadingColor,
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  BlocProvider.of<ProductDataBloc>(context)
                      .add(NavigateToHome());
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Cart',
                style: kshoppingHeadingStyle,
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: GestureDetector(
                onTap: (state as LoadedState).cartProducts.isEmpty
                    ? null
                    : () {
                        BlocProvider.of<ProductDataBloc>(context)
                            .add(PlaceOrder());
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrdersScreen()));
                      },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kmainHeadingColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 25,
                  child: const Text(
                    'BUY',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            body: const CartBody(),
          );
        },
      ),
    );
  }
}
