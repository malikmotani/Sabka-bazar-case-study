// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      bannerImageUrl: json['bannerImageUrl'] as String?,
      bannerImageAlt: json['bannerImageAlt'] as String?,
      isActive: json['isActive'] as bool?,
      order: json['order'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'bannerImageUrl': instance.bannerImageUrl,
      'bannerImageAlt': instance.bannerImageAlt,
      'isActive': instance.isActive,
      'order': instance.order,
      'id': instance.id,
    };
