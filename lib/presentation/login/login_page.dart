import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/login/login_bloc.dart';
import 'package:sabka_bazar/bloc/login/login_event.dart';
import 'package:sabka_bazar/bloc/login/login_state.dart';
import 'package:sabka_bazar/presentation/common/progress_dialog.dart';
import 'package:sabka_bazar/presentation/home/home_page.dart';
import 'package:sabka_bazar/presentation/signup/signup_page.dart';

import '../common/app_solid_button.dart';
import '../common/app_text_field.dart';
import '../common/app_text_button.dart';
import 'copyright/copyright_widget.dart';

class LoginPage extends StatelessWidget {
  static const String routName = "/login";

  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomAppBar(
        child: CopyrightWidget(),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            ProgressDialog.show(context);
          } else if (state is LoginSuccessState) {
            ProgressDialog.hide(context);
            Navigator.pushReplacementNamed(
              context,
              HomePage.routName,
            );
          } else if (state is LoginErrorState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.exception.toString())),
            );
          }
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 20),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Get access to your Orders, Wishlist and Recommendations.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    labelText: "Email",
                    hintText: "Enter your Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  AppTextField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    isSecureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 30),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                      minHeight: 50.0,
                    ),
                    child: AppSolidButton(
                      text: "Login",
                      onPressed: () => _loginBtnTapped(context),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do not have an account?",
                        textAlign: TextAlign.center,
                      ),
                      AppTextButton(
                        text: "Signup",
                        onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            SignupPage.routName,
                          )
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginBtnTapped(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.add(
      InitLoginEvent(_emailController.text, _passwordController.text),
    );
  }
}
