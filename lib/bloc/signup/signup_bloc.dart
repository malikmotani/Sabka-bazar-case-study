import 'package:bloc/bloc.dart';
import 'package:sabka_bazar/bloc/signup/signup_event.dart';
import 'package:sabka_bazar/bloc/signup/signup_state.dart';
import 'package:sabka_bazar/remote/repository/login_repository.dart';

import '../../exception/app_exception.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _loginRepository = AuthRepository();

  SignupBloc() : super(SignupState()) {
    on<InitSignupEvent>((event, emit) async {
      //TODO: Add validations here
      if (event.firstName.isEmpty) {
        emit(SignupErrorState(AppException("Please enter valid First name")));
      } else if (event.lastName.isEmpty) {
        emit(SignupErrorState(AppException("Please enter valid Last name")));
      } else if (event.email.isEmpty) {
        emit(SignupErrorState(AppException("Please enter valid email")));
      } else if (event.password.isEmpty) {
        emit(SignupErrorState(AppException("Please enter valid password")));
      } else {
        emit(SignupLoadingState());
        try {
          final loginModel = await _loginRepository.requestSignup(
              event.firstName, event.lastName, event.email, event.password);
          emit(SignupSuccessState(loginModel));
        } on AppException catch (e) {
          emit(SignupErrorState(e));
        }
      }
    });
  }

// void requestLogin() {
//   emit(LoadingState());
//   try {
//     _loginRepository.requestLogin(email, password);
//   } catch (e) {
//     print("LoginBloc: requestLogin $e");
//   }
// }
}
