import 'package:sabka_bazar/exception/app_exception.dart';
import 'package:sabka_bazar/remote/models/offer_model.dart';

class OfferState {}

class OfferLoadingState extends OfferState {}

class OfferSuccessState extends OfferState {
  final List<OfferModel> offers;

  OfferSuccessState(this.offers);
}

class OfferErrorState extends OfferState {
  final AppException exception;

  OfferErrorState(this.exception);
}
