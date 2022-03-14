// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String?,
      categoryId: json['categoryId'] as String?,
      key: json['key'] as String?,
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
      order: json['order'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'key': instance.key,
      'description': instance.description,
      'enabled': instance.enabled,
      'order': instance.order,
      'imageUrl': instance.imageUrl,
    };
