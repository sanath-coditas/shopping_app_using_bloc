import 'package:bloc/bloc.dart';
import 'package:shopping_app_assignment/models/product.dart';
import 'package:shopping_app_assignment/repository/product_data_repository.dart';
part 'product_data_event.dart';
part 'product_data_state.dart';

class ProductDataBloc extends Bloc<ProductDataEvent, ProductDataState> {
  List<Product> products = [];
  List<Product> cartProducts = [];
  List<Product> orderedProducts = [];
  ProductDataBloc() : super(ProductDataInitial()) {
    on<ProductDataEvent>((event, emit) {});
    on<FetchData>((event, emit) async {
      ProductDataRepository productDataRepository = ProductDataRepository();
      try {
        products = await productDataRepository.fetchProducts();
        return emit(LoadedState(
            products: products, cartProducts: [], orderedProducts: []));
      } catch (error) {
        return emit(ErrorState(message: 'Something went wrong!!'));
      }
    });
    on<AddQuantity>((event, emit) {
      products[event.index].quantitiy += 1;
      return emit(LoadedState(
          products: products, cartProducts: cartProducts, orderedProducts: []));
    });
    on<RemoveQuantity>((event, emit) {
      if (products[event.index].quantitiy > 0) {
        products[event.index].quantitiy -= 1;
      }
      return emit(LoadedState(
          products: products, cartProducts: cartProducts, orderedProducts: []));
    });
    on<AddToCart>((event, emit) {
      if (products[event.index].quantitiy > 0 &&
          !products[event.index].isAddedtoCart) {
        products[event.index].isAddedtoCart = true;
        cartProducts.add(products[event.index]);
      }
      return emit(LoadedState(
          products: products, cartProducts: cartProducts, orderedProducts: []));
    });

    on<CartScreenNavigateEvent>((event, emit) {
      return emit(LoadedState(
          products: products, cartProducts: cartProducts, orderedProducts: []));
    });

    on<NavigateToHome>((event, emit) {
      return emit(LoadedState(
          products: products, cartProducts: cartProducts, orderedProducts: []));
    });

    on<PlaceOrder>((event, emit) {
      if (cartProducts.isEmpty) {
        return emit(LoadedState(
            products: products, cartProducts: [], orderedProducts: []));
      } else {
        orderedProducts = cartProducts;
        cartProducts.forEach((element) {
          element.isAddedtoCart = false;
          element.quantitiy = 0;
        });
        cartProducts = [];
        return emit(LoadedState(
            products: products,
            cartProducts: cartProducts,
            orderedProducts: orderedProducts));
      }
    });
    on<RemoveFromCartEvent>((event, emit) {
      Product tempProduct = cartProducts[event.index];
      int tempIndex = products.indexOf(tempProduct);
      products[tempIndex].quantitiy = 0;
      products[tempIndex].isAddedtoCart = false;
      cartProducts.removeAt(event.index);

      return emit(LoadedState(
          products: products,
          cartProducts: cartProducts,
          orderedProducts: orderedProducts));
    });
  }
}
