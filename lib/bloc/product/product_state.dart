import 'package:sabka_bazar/remote/models/product_model.dart';

class ProductState {}

class InitProductState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<ProductModel> products;

  ProductSuccessState(this.products);
}

class ProductErrorState extends ProductState {
  final Exception exception;

  ProductErrorState(this.exception);
}
