import 'package:sabka_bazar/remote/models/login_model.dart';
import 'package:sabka_bazar/remote/models/login_request.dart';
import 'package:sabka_bazar/remote/models/login_response.dart';

import '../../exception/app_exception.dart';
import '../models/signup_request.dart';
import '../retrofit/retrofit_client.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();

  AuthRepository._internal();

  final RetrofitClient _retrofitClient = RetrofitClient(Dio());

  factory AuthRepository() {
    return _singleton;
  }

  Future<LoginModel> requestLogin(String email, String password) async {
    LoginResponse loginResponse =
        await _retrofitClient.requestLogin(LoginRequest(email, password));
    if (loginResponse.success) {
      if (loginResponse.data != null) {
        return loginResponse.data!;
      }
    }
    throw AppException("Something went wrong!");
  }

  Future<LoginModel> requestSignup(
      String firstName, String lastName, String email, String password) async {
    LoginResponse signUpResponse = await _retrofitClient
        .requestSignUp(SignupRequest(firstName, lastName, email, password));
    if (signUpResponse.success) {
      if (signUpResponse.data != null) {
        return signUpResponse.data!;
      }
    }
    throw AppException("Something went wrong!");
  }
}
