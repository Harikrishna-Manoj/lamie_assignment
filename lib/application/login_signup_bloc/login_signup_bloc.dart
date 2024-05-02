import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_signup_event.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvent, LoginSignupState> {
  LoginSignupBloc() : super(LoginSignupInitial()) {
    on<LoginSignupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
