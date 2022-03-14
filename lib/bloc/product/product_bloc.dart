import 'package:bloc/bloc.dart';
import 'package:sabka_bazar/bloc/product/product_state.dart';
import 'package:sabka_bazar/remote/models/product_model.dart';
import 'package:sabka_bazar/remote/repository/product_repository.dart';

import '../../exception/app_exception.dart';

class ProductBloc extends Cubit<ProductState> {
  final ProductRepository _productRepository = ProductRepository();

  ProductBloc() : super(ProductLoadingState());

  void requestProducts() async {
    emit(ProductLoadingState());
    try {
      final List<ProductModel> products =
          await _productRepository.requestProducts();
      emit(ProductSuccessState(products));
    } on AppException catch (e) {
      emit(ProductErrorState(e));
    }
  }
}
