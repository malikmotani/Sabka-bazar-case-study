// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      productId: json['productId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageURL: json['imageURL'] as String?,
      price: json['price'] as int?,
      stock: json['stock'] as int?,
      category: json['category'] as String?,
      sku: json['sku'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'imageURL': instance.imageURL,
      'price': instance.price,
      'stock': instance.stock,
      'category': instance.category,
      'sku': instance.sku,
      'qty': instance.qty,
    };
