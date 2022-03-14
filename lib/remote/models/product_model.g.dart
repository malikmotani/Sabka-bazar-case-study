// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['productId'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageURL: json['imageURL'] as String?,
      price: json['price'] as int?,
      stock: json['stock'] as int?,
      category: json['category'] as String?,
      sku: json['sku'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'imageURL': instance.imageURL,
      'price': instance.price,
      'stock': instance.stock,
      'category': instance.category,
      'sku': instance.sku,
    };
