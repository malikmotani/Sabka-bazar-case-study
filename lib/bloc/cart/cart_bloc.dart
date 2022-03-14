import 'package:bloc/bloc.dart';

import '../../exception/app_exception.dart';
import '../../remote/models/cart_model.dart';
import '../../remote/repository/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository = CartRepository();

  CartBloc() : super(CartLoadingState()) {
    on<FetchCart>((event, emit) async {
      emit(CartLoadingState());
      try {
        final List<CartModel> cartItems = await _cartRepository.getCart();
        emit(CartSuccessState(cartItems));
      } on AppException catch(e){
        emit(CartErrorState(e));
      }
    });
  }
}
