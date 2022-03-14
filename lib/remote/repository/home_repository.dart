import 'package:sabka_bazar/exception/app_exception.dart';

import '../models/category_model.dart';
import '../models/category_response.dart';
import '../models/offer_model.dart';
import 'package:dio/dio.dart';

import '../models/offer_response.dart';
import '../retrofit/retrofit_client.dart';

class HomeRepository {
  static final HomeRepository _singleton = HomeRepository._internal();

  HomeRepository._internal();

  final RetrofitClient _retrofitClient = RetrofitClient(Dio());

  factory HomeRepository() {
    return _singleton;
  }

  Future<List<CategoryModel>> requestCategories() async {
    CategoryResponse response = await _retrofitClient.getCategories();
    if (response.success) {
      if (response.data != null && response.data!.isNotEmpty) {
        return response.data!;
      }
    }
    throw Exception("Something went wrong!");
  }

  Future<List<OfferModel>> requestOffers() async {
    try {
      OfferResponse response = await _retrofitClient.getOffers();
      if (response.success) {
        if (response.data != null && response.data!.isNotEmpty) {
          return response.data!;
        }
      }
      throw AppException("Something went wrong");
    } on Exception catch (e) {
      throw AppException(e.toString());
    }
  }
}
