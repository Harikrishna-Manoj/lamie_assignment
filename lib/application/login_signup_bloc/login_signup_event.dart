part of 'login_signup_bloc.dart';

@immutable
sealed class LoginSignupEvent {}

class LogInUserEvent extends LoginSignupEvent {
  final String emailId, password;

  LogInUserEvent({required this.emailId, required this.password});
}

class SignUpUserEvent extends LoginSignupEvent {
  final String emailId, userName, password, confirmPassword;
  final bool isGoggle;

  SignUpUserEvent(
      {required this.emailId,
      required this.userName,
      required this.password,
      required this.confirmPassword,
      required this.isGoggle});
}

class GoogleSignIEvent extends LoginSignupEvent {}
