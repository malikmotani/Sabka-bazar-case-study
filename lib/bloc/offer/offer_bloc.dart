import 'package:bloc/bloc.dart';
import 'package:sabka_bazar/bloc/offer/offer_event.dart';
import 'package:sabka_bazar/remote/models/offer_model.dart';
import 'package:sabka_bazar/remote/repository/home_repository.dart';

import '../../exception/app_exception.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final HomeRepository _homeRepository = HomeRepository();

  OfferBloc() : super(OfferLoadingState()) {
    on<FetchOffers>((event, emit) async {
      try {
        emit(OfferLoadingState());
        final List<OfferModel> offers = await _homeRepository.requestOffers();
        emit(OfferSuccessState(offers));
      } on AppException catch (e) {
        emit(OfferErrorState(e));
      }
    });
  }
}
