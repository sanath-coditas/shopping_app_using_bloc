import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';

import '../constants.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProductDataBloc>(context),
      child: Scaffold(
        backgroundColor: kbackgroundColor,
        appBar: AppBar(
          backgroundColor: kbackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Orders',
            style: kshoppingHeadingStyle,
          ),
          leading: IconButton(
            color: kheadingColor,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<ProductDataBloc, ProductDataState>(
          builder: (context, state) {
            if ((state as LoadedState).orderedProducts.isEmpty) {
              return const Center(child: Text('No Purchase history availale'));
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: ktileBoxDecoration,
                    child: ListTile(
                      leading:
                          Image.network(state.orderedProducts[index].image),
                      title: const Text(
                        'Purchased in Oct',
                        style: ksubTitleTextStyle,
                      ),
                      subtitle: Text(
                        state.orderedProducts[index].title,
                        style: ktitleTextStyle,
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: kmainHeadingColor, width: 1.0)),
                        child: Text(
                          '\$${state.orderedProducts[index].price.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 25),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.orderedProducts.length,
              );
            }
          },
        ),
      ),
    );
  }
}
