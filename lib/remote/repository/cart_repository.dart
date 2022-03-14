import 'package:sabka_bazar/remote/models/cart_model.dart';
import 'package:dio/dio.dart';
import 'package:sabka_bazar/remote/models/cart_response.dart';
import '../../exception/app_exception.dart';
import '../retrofit/retrofit_client.dart';

class CartRepository {
  static final CartRepository _singleton = CartRepository._internal();

  CartRepository._internal();

  final RetrofitClient _retrofitClient = RetrofitClient(Dio());

  factory CartRepository() {
    return _singleton;
  }

  Future<List<CartModel>> getCart() async {
    CartResponse response = await _retrofitClient.getCart();
    if (response.success) {
      if (response.data != null && response.data!.isNotEmpty) {
        return response.data!;
      }
    }
    throw AppException("Something went wrong!");
  }
}
