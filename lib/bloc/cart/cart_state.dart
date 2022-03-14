import '../../exception/app_exception.dart';
import '../../remote/models/cart_model.dart';

class CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<CartModel> cartItems;

  CartSuccessState(this.cartItems);
}

class CartErrorState extends CartState {
  AppException exception;

  CartErrorState(this.exception);
}
