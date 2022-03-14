import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? productId;
  String? name;
  String? description;
  String? imageURL;
  int? price;
  int? stock;
  String? category;
  String? sku;

  ProductModel({
    this.productId,
    this.name,
    this.description,
    this.imageURL,
    this.price,
    this.stock,
    this.category,
    this.sku,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
