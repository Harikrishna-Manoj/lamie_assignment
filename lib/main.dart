import 'package:flutter/material.dart';
import 'package:lamie_pro/application/login_signup_bloc/login_signup_bloc.dart';
import 'package:lamie_pro/application/search_bloc/search_bloc.dart';
import 'package:lamie_pro/application/user_bloc/user_bloc.dart';
import 'package:lamie_pro/presentation/screens/signin_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginSignupBloc(),
          ),
          BlocProvider(
            create: (context) => UserBloc(),
          ),
          BlocProvider(
            create: (context) => SearchBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ));
  }
}
