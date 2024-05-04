import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/service/authentication/google_signin.dart';
import 'package:lamie_pro/service/authentication/login_service.dart';
import 'package:lamie_pro/service/authentication/signup_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_signup_event.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvent, LoginSignupState> {
  LoginSignupBloc() : super(LoginSignupInitial()) {
    on<SignUpUserEvent>((event, emit) async {
      emit(LoadingState());
      var (String confirmationText, String statusCode) =
          await UserSignUpService().userSignUp(
              emailId: event.emailId,
              userName: event.userName,
              password: event.password,
              confirmPassword: event.confirmPassword,
              isGoggle: event.isGoggle);
      if (statusCode == "201") {
        emit(SignUpSubmittedState(
            resultText: confirmationText, statusCode: statusCode));
      }
    });

    on<LogInUserEvent>((event, emit) async {
      emit(LoadingState());
      String statusCode = await UserLogInService()
          .userLogIn(emailId: event.emailId, password: event.password);
      if (statusCode == "200") {
        emit(LogInSubmittedState());
      }
    });
    on<GoogleSignIEvent>((event, emit) async {
      emit(LoadingState());
      var (String statusCode, String confirmationText) =
          await UserGoogleSignIn().googleSignIn();
      if (statusCode == "200") {
        emit(GoogleLogInSubmittedState(
            resultText: confirmationText, statusCode: statusCode));
      }
    });
  }
}
