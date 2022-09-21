import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_assignment/bloc/product_bloc/product_data_bloc.dart';
import 'package:shopping_app_assignment/widgets/products_item.dart';
import 'package:shopping_app_assignment/widgets/shimmer_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDataBloc, ProductDataState>(
      builder: (context, state) {
        if (state is ProductDataInitial) {
          // Triggering the FetchData Event
          BlocProvider.of<ProductDataBloc>(context).add(FetchData());
          return const ShimmerWidget();
        } else if (state is LoadedState) {
          return ProductsItem();
        } else if (state is ErrorState) {
          return AlertDialog(title: Text(state.message.toString()));
        } else {
          return ProductsItem();
        }
      },
    );
  }
}
