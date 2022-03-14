import 'package:bloc/bloc.dart';
import 'package:sabka_bazar/bloc/home/category_event.dart';
import 'package:sabka_bazar/remote/repository/home_repository.dart';

import '../../exception/app_exception.dart';
import '../../remote/models/category_model.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HomeRepository _homeRepository = HomeRepository();

  CategoryBloc() : super(CategoryLoadingState()) {
    on<FetchCategories>((event, emit) async {
      try {
        emit(CategoryLoadingState());
        final List<CategoryModel> categories =
        await _homeRepository.requestCategories();
        emit(CategorySuccessState(categories));
      } on AppException catch(e){
        emit(CategoryErrorState(e));
      }
    });
  }
}
