import 'package:sabka_bazar/remote/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sabka_bazar/remote/models/offer_model.dart';
part 'offer_response.g.dart';

@JsonSerializable()
class OfferResponse extends BaseResponse {
  List<OfferModel>? data;
  OfferResponse(this.data);

  factory OfferResponse.fromJson(Map<String, dynamic> json) => _$OfferResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfferResponseToJson(this);
}
