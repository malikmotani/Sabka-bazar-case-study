import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/cart/cart_bloc.dart';
import 'package:sabka_bazar/bloc/login/login_bloc.dart';
import 'package:sabka_bazar/bloc/offer/offer_bloc.dart';
import 'package:sabka_bazar/bloc/product/product_bloc.dart';
import 'package:sabka_bazar/bloc/signup/signup_bloc.dart';
import 'package:sabka_bazar/presentation/home/home_page.dart';
import 'package:sabka_bazar/presentation/login/login_page.dart';

import 'bloc/home/category_bloc.dart';
import 'presentation/cart/cart_page.dart';
import 'presentation/signup/signup_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider<OfferBloc>(
          create: (context) => OfferBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home: LoginPage(),
      routes: {
        SignupPage.routName: (_) => SignupPage(),
        CartPage.routName: (_) => const CartPage(),
        HomePage.routName: (_) => const HomePage()
      },
    );
  }
}
