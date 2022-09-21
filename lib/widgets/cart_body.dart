import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';
import 'package:shopping_app_assignment/constants.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDataBloc, ProductDataState>(
      builder: (context, state) {
        if ((state as LoadedState).cartProducts.isEmpty) {
          return const Center(
            child: Text(
              'Add some items first',
              style: kheadingStyle,
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: ktileBoxDecoration,
              child: ListTile(
                onLongPress: () {
                  BlocProvider.of<ProductDataBloc>(context)
                      .add(RemoveFromCartEvent(index: index));
                },
                leading: Image.network(state.cartProducts[index].image),
                title: Text(
                  state.cartProducts[index].title,
                  style: ktitleTextStyle,
                ),
                subtitle: Text(
                  'x${state.cartProducts[index].quantitiy}',
                  style: ksubTitleTextStyle,
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: kmainHeadingColor, width: 1.0)),
                  child: Text(
                    '\$${state.cartProducts[index].price.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 25),
                  ),
                ),
              ),
            );
          },
          itemCount: state.cartProducts.length,
        );
      },
    );
  }
}
