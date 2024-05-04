part of 'login_signup_bloc.dart';

@immutable
sealed class LoginSignupState {}

final class LoginSignupInitial extends LoginSignupState {}

class LoadingState extends LoginSignupState {}

final class LogInSubmittedState extends LoginSignupState {}

final class SignUpSubmittedState extends LoginSignupState {
  final String resultText, statusCode;

  SignUpSubmittedState({required this.resultText, required this.statusCode});
}

final class GoogleLogInSubmittedState extends LoginSignupState {
  final String resultText, statusCode;

  GoogleLogInSubmittedState(
      {required this.statusCode, required this.resultText});
}
