part of 'product_data_bloc.dart';

abstract class ProductDataState {
  get products => null;
}

class ProductDataInitial extends ProductDataState {}

class InitialState extends ProductDataState {}

@override
class LoadedState extends ProductDataState {
  @override
  final List<Product> products;
  final List<Product> cartProducts;
  final List<Product> orderedProducts;
  LoadedState({required this.products, required this.cartProducts, required this.orderedProducts});
}

@override
class ErrorState extends ProductDataState {
  final String message;
  ErrorState({required this.message});
}
