import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/application/login_signup_bloc/login_signup_bloc.dart';
import 'package:lamie_pro/core/constants/utils/constant.dart';
import 'package:lamie_pro/presentation/screens/login_screen.dart';
import 'package:lamie_pro/presentation/screens/user_screen.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  // final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 12),
                ),
                kHeight30,
                TextFormFeildSignin(
                  controller: emailController,
                  title: 'Email Id',
                  hiniText: 'eg: johnsmith@gmail.com',
                  emailValidation: true,
                ),
                kHeight30,
                TextFormFeildSignin(
                    hiniText: 'John',
                    controller: userNameController,
                    title: 'Username'),
                kHeight30,
                TextFormFeildSignin(
                  controller: passwordController1,
                  title: 'Password',
                  hiniText: 'eg: @johnsmith8567',
                  passwordVisibility: true,
                  trailIcon1: Icons.visibility,
                  trailIcon2: Icons.visibility_off,
                  isPasswordLength: true,
                ),
                kHeight30,
                TextFormFeildSignin(
                  controller: passwordController2,
                  title: 'Confirm password',
                  hiniText: 'eg: @johnsmith8567',
                  passwordVisibility: true,
                  trailIcon1: Icons.visibility,
                  trailIcon2: Icons.visibility_off,
                  isPasswordLength: true,
                ),
                kHeight30,
                kHeight30,
                InkWell(
                  onTap: () {
                    if (passwordController1.text.isEmpty ||
                        passwordController2.text.isEmpty ||
                        userNameController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      showSnackbar('All fields are required', context);
                    } else if (passwordController1.text.length < 8 ||
                        passwordController2.text.length < 8) {
                      showSnackbar(
                          'Password must contain more than 8 letters', context);
                    } else if (passwordController1.text !=
                        passwordController2.text) {
                      showSnackbar('Enter the same password', context);
                    } else {
                      context.read<LoginSignupBloc>().add(SignUpUserEvent(
                          emailId: emailController.text,
                          userName: userNameController.text,
                          password: passwordController1.text,
                          confirmPassword: passwordController2.text,
                          isGoggle: false));
                    }
                  },
                  child: BlocListener<LoginSignupBloc, LoginSignupState>(
                    listener: (context, state) {
                      if (state is SignUpSubmittedState) {
                        if (state.statusCode == "201") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.resultText)));
                        }
                      }
                      if (state is GoogleLogInSubmittedState) {
                        if (state.statusCode == "200") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserScreen(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.resultText)));
                        }
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
                        string: 'SIGN IN',
                        stringColor: Colors.white),
                  ),
                ),
                kHeight10,
                const HaveAccount(),
                kHeight20,
                const Center(child: Text('• or sign up with •')),
                kHeight20,
                const GoogleSignUpButton(),
                kHeight20
              ],
            ),
          ),
        ),
      )),
    );
  }
}
