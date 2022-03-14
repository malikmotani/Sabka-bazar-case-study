import 'package:sabka_bazar/remote/models/product_response.dart';

import '../../exception/app_exception.dart';
import '../models/product_model.dart';
import 'package:dio/dio.dart';
import '../retrofit/retrofit_client.dart';

class ProductRepository {
  static final ProductRepository _singleton = ProductRepository._internal();

  ProductRepository._internal();

  final RetrofitClient _retrofitClient = RetrofitClient(Dio());

  factory ProductRepository() {
    return _singleton;
  }

  Future<List<ProductModel>> requestProducts() async {
    ProductResponse response = await _retrofitClient.getProducts();
    if (response.success) {
      if (response.data != null && response.data!.isNotEmpty) {
        return response.data!;
      }
    }
    throw AppException("Something went wrong!");
  }
}
