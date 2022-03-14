import 'package:json_annotation/json_annotation.dart';
part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  String? bannerImageUrl;
  String? bannerImageAlt;
  bool? isActive;
  int? order;
  String? id;

  OfferModel(
      {this.bannerImageUrl,
      this.bannerImageAlt,
      this.isActive,
      this.order,
      this.id});

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
