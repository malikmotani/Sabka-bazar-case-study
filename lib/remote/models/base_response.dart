import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  bool success = false;
  String message = "Something went wrong!";
}
