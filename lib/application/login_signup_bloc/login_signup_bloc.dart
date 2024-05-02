import 'package:flutter_bloc/flutter_bloc.dart';
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
      var resultRecord = await UserSignUpService().userSignUp(
          emailId: event.emailId,
          userName: event.userName,
          password: event.password,
          confirmPassword: event.confirmPassword,
          isGoggle: event.isGoggle);
      if (resultRecord?.$2 == "201") {
        emit(SignUpSubmittedState(
            resultText: resultRecord?.$1 ?? "Something went wrong",
            statusCode: resultRecord?.$2 ?? ""));
      }
    });

    on<LogInUserEvent>((event, emit) async {
      emit(LoadingState());
      String statusCode = await UserLogInService()
          .userLogIn(emailId: event.emailId, password: event.password);
      print("statusCode$statusCode");
      if (statusCode == "200") {
        emit(LogInSubmittedState());
      }
    });
  }
}
