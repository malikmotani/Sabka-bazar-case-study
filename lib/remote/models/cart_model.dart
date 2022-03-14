import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  String? productId;
  String? name;
  String? description;
  String? imageURL;
  int? price = 0;
  int? stock;
  String? category;
  String? sku;
  int? qty = 1;

  CartModel(
      {this.productId,
      this.name,
      this.description,
      this.imageURL,
      this.price,
      this.stock,
      this.category,
      this.sku,
      this.qty});

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
