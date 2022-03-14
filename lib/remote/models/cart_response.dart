import 'package:sabka_bazar/remote/models/base_response.dart';
import 'package:sabka_bazar/remote/models/cart_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse extends BaseResponse {
  List<CartModel>? data;
  CartResponse(this.data);

  factory CartResponse.fromJson(Map<String, dynamic> json) => _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
