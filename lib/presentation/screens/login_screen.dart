import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/application/login_signup_bloc/login_signup_bloc.dart';
import 'package:lamie_pro/core/constants/utils/constant.dart';
import 'package:lamie_pro/presentation/screens/user_screen.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackNavigationButton(),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight30,
                  kHeight30,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                    child: const Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Please login to continue",
                    style: TextStyle(fontSize: 12),
                  ),
                  kHeight30,
                  kHeight30,
                  TextFormFeildSignin(
                    controller: emailController,
                    title: 'Email Id',
                    hiniText: 'eg: johnsmith@gmail.com',
                    emailValidation: true,
                  ),
                  kHeight30,
                  TextFormFeildSignin(
                    controller: passwordController,
                    title: 'Password',
                    hiniText: 'eg: @johnsmith8567',
                    passwordVisibility: true,
                    trailIcon1: Icons.visibility,
                    trailIcon2: Icons.visibility_off,
                    isPasswordLength: true,
                  ),
                  kHeight100,
                  kHeight10,
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (passwordController.text.isEmpty ||
                            emailController.text.isEmpty) {
                          showSnackbar('All fields are required', context);
                        } else if (passwordController.text.length < 8) {
                          showSnackbar(
                              'Password must contain more than 8 letters',
                              context);
                        } else {
                          if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text)) {
                            context.read<LoginSignupBloc>().add(LogInUserEvent(
                                emailId: emailController.text,
                                password: passwordController.text));
                          } else {
                            showSnackbar('Email format is incorrect', context);
                          }
                        }
                      },
                      child: BlocListener<LoginSignupBloc, LoginSignupState>(
                        listener: (context, state) {
                          if (state is LogInSubmittedState) {
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const UserScreen();
                              },
                            ));
                          }
                          if (state is LoadingState) {
                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          }
                        },
                        child: const ActionButtons(
                            colr: Colors.black,
                            string: 'LOG IN',
                            stringColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
