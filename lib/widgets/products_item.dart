import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';
import 'package:shopping_app_assignment/constants.dart';

class ProductsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDataBloc, ProductDataState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height / 4.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 8, left: 20),
                              child: Image.network(state.products[index].image),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.products[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: kmainHeadingColor),
                              ),
                              Text(
                                state.products[index].description,
                                style: const TextStyle(fontSize: 15),
                                softWrap: true,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${state.products[index].price.toString()}',
                                style: kpriceStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: (state)
                                              .products[index]
                                              .isAddedtoCart
                                          ? null
                                          : () {
                                              BlocProvider.of<ProductDataBloc>(
                                                      context)
                                                  .add(AddToCart(index: index));
                                            },
                                      style: kaddButtonStyle,
                                      child: (state)
                                              .products[index]
                                              .isAddedtoCart
                                          ? const Text('    ADDED    ')
                                          : const Text('    ADD    '),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                      color: kmainHeadingColor,
                                      onPressed: (state)
                                              .products[index]
                                              .isAddedtoCart
                                          ? null
                                          : () {
                                              BlocProvider.of<ProductDataBloc>(
                                                      context)
                                                  .add(RemoveQuantity(
                                                      index: index));
                                            },
                                    ),
                                    Text(
                                      state.products[index].quantitiy
                                          .toString(),
                                      style: knumberStyle,
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        iconSize: 30,
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        color: kmainHeadingColor,
                                        onPressed: (state)
                                                .products[index]
                                                .isAddedtoCart
                                            ? null
                                            : () {
                                                BlocProvider.of<
                                                            ProductDataBloc>(
                                                        context)
                                                    .add(AddQuantity(
                                                        index: index));
                                              },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline),
                          color: kmainHeadingColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            },
            itemCount: (state as LoadedState).products.length,
          ),
        );
      },
    );
  }
}
