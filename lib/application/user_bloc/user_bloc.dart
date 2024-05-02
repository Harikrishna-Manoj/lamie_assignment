import 'package:bloc/bloc.dart';
import 'package:lamie_pro/core/model/user_model.dart';
import 'package:lamie_pro/service/user_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserDataEvent>((event, emit) async {
      await UserService().getAllUserData();
    });
  }
}
