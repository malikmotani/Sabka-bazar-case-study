import 'package:sabka_bazar/remote/models/base_response.dart';
import 'package:sabka_bazar/remote/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sabka_bazar/remote/models/login_model.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  LoginModel? data;
  LoginResponse(this.data);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
