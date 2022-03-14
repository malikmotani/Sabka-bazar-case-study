import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sabka_bazar/remote/models/cart_response.dart';
import 'package:sabka_bazar/remote/models/login_request.dart';
import 'package:sabka_bazar/remote/models/product_response.dart';
import 'package:sabka_bazar/remote/models/signup_request.dart';

import '../models/category_model.dart';
import '../models/category_response.dart';
import '../models/login_response.dart';
import '../models/offer_response.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://private-351e00-malikps.apiary-mock.com/")
abstract class RetrofitClient {
  static final RetrofitClient client = RetrofitClient(Dio());

  factory RetrofitClient(Dio dio) = _RetrofitClient;

  @POST("login")
  Future<LoginResponse> requestLogin(@Body() LoginRequest loginRequest);

  @POST("signup")
  Future<LoginResponse> requestSignUp(@Body() SignupRequest signupRequest);

  @GET("categories")
  Future<CategoryResponse> getCategories();

  @GET("offers")
  Future<OfferResponse> getOffers();

  @GET("products")
  Future<ProductResponse> getProducts();

  @GET("cart")
  Future<CartResponse> getCart();
}
