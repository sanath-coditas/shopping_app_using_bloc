part of 'product_data_bloc.dart';

abstract class ProductDataEvent {}

class FetchData extends ProductDataEvent {}

class AddQuantity extends ProductDataEvent {
  int index;
  AddQuantity({required this.index});
}

class RemoveQuantity extends ProductDataEvent {
  int index;
  RemoveQuantity({required this.index});
}

class AddToCart extends ProductDataEvent {
  int index;
  AddToCart({required this.index});
}

class CartScreenNavigateEvent extends ProductDataEvent {}

class NavigateToHome extends ProductDataEvent {}

class PlaceOrder extends ProductDataEvent {}

class RemoveFromCartEvent extends ProductDataEvent {
  int index;
  RemoveFromCartEvent({required this.index});
}
