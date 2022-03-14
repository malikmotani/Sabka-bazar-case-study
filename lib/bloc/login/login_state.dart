import 'package:sabka_bazar/remote/models/login_model.dart';

import '../../exception/app_exception.dart';

class LoginState {}

class InitLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final AppException exception;

  LoginErrorState(this.exception);
}
