import '../../exception/app_exception.dart';
import '../../remote/models/category_model.dart';

class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccessState(this.categories);
}

class CategoryErrorState extends CategoryState {
  final AppException exception;

  CategoryErrorState(this.exception);
}
