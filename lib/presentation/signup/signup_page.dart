import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/signup/signup_bloc.dart';
import 'package:sabka_bazar/bloc/signup/signup_event.dart';
import 'package:sabka_bazar/bloc/signup/signup_state.dart';
import 'package:sabka_bazar/presentation/common/app_solid_button.dart';
import 'package:sabka_bazar/presentation/common/app_text_button.dart';
import 'package:sabka_bazar/presentation/common/progress_dialog.dart';
import 'package:sabka_bazar/presentation/home/home_page.dart';

import '../common/app_text_field.dart';
import '../login/copyright/copyright_widget.dart';

class SignupPage extends StatelessWidget {
  static const String routName = "/signup";

  SignupPage({Key? key}) : super(key: key);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Signup"),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: CopyrightWidget(),
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            ProgressDialog.show(context);
          } else if (state is SignupSuccessState) {
            ProgressDialog.hide(context);
            Navigator.pushReplacementNamed(context, HomePage.routName);
          } else if (state is SignupErrorState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.exception.toString())),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "We do not share your personal details with anyone.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  labelText: "First Name",
                  hintText: "Enter your First Name",
                  keyboardType: TextInputType.name,
                  controller: _firstNameController,
                ),
                AppTextField(
                  labelText: "Last Name",
                  hintText: "Enter your Last Name",
                  keyboardType: TextInputType.name,
                  controller: _lastNameController,
                ),
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
                    text: "Signup",
                    onPressed: () => _signupBtnTapped(context),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "OR",
                  style: TextStyle(
                    // fontFamily: 'SourceSansPro',
                    // fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    // letterSpacing: 2.5,
                    // color: Colors.teal[100],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      textAlign: TextAlign.center,
                    ),
                    AppTextButton(
                      text: "Login",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signupBtnTapped(BuildContext context) {
    SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);
    signupBloc.add(InitSignupEvent(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    ));
  }
}
