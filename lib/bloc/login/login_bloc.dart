import 'package:bloc/bloc.dart';
import 'package:sabka_bazar/bloc/login/login_event.dart';
import 'package:sabka_bazar/bloc/login/login_state.dart';
import 'package:sabka_bazar/remote/repository/login_repository.dart';

import '../../exception/app_exception.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _loginRepository = AuthRepository();

  LoginBloc() : super(LoginState()) {
    on<InitLoginEvent>((event, emit) async {
      //TODO: Add email/password validation here
      if (event.email.isEmpty) {
        emit(LoginErrorState(AppException("Please enter valid email")));
      } else if (event.password.isEmpty) {
        emit(LoginErrorState(AppException("Please enter valid password")));
      } else {
        emit(LoginLoadingState());
        try {
          final loginModel =
              await _loginRepository.requestLogin(event.email, event.password);
          emit(LoginSuccessState(loginModel));
        } on AppException catch (e) {
          emit(LoginErrorState(e));
        }
      }
    });
  }
}
