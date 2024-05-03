import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/core/model/user_model.dart';
import 'package:lamie_pro/service/user_service/user_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserDataEvent>((event, emit) async {
      emit(UserDataLoadingState());
      List<Connections> userConnectionList =
          await UserService().getAllUserData();
      emit(UserDataLoadedState(userList: userConnectionList));
    });
  }
}
