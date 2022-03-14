import 'package:sabka_bazar/remote/models/base_response.dart';
import 'package:sabka_bazar/remote/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends BaseResponse {
  List<CategoryModel>? data;
  CategoryResponse(this.data);

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
