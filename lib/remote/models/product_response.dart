import 'package:sabka_bazar/remote/models/base_response.dart';
import 'package:sabka_bazar/remote/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sabka_bazar/remote/models/offer_model.dart';
import 'package:sabka_bazar/remote/models/product_model.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseResponse {
  List<ProductModel>? data;
  ProductResponse(this.data);

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
