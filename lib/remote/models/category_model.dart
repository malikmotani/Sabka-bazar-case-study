import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? categoryId;
  String? name;
  String? key;
  String? description;
  bool? enabled;
  int? order;
  String? imageUrl;

  CategoryModel({
    this.name,
    this.categoryId,
    this.key,
    this.description,
    this.enabled,
    this.order,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
