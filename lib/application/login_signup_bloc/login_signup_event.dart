part of 'login_signup_bloc.dart';

@immutable
sealed class LoginSignupEvent {}

class LogInUser extends LoginSignupEvent {
  final String emailId, password;

  LogInUser({required this.emailId, required this.password});
}

class SignUpUser extends LoginSignupEvent {}
