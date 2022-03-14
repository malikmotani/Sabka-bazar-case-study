import 'package:sabka_bazar/remote/models/login_model.dart';

import '../../exception/app_exception.dart';

class SignupState {}

class InitSignupState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final LoginModel loginModel;

  SignupSuccessState(this.loginModel);
}

class SignupErrorState extends SignupState {
  final AppException exception;

  SignupErrorState(this.exception);
}
