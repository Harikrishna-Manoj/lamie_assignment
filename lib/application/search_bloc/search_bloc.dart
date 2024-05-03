import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/core/model/search_model.dart';
import 'package:lamie_pro/service/user_service/search_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchUserDataEvent>((event, emit) async {
      emit(SearchUserDataLoadingState());
      List<SearchModel> searchList =
          await SearchService().searchUser(userName: event.searchingUser);
      emit(SearchUserDataLoadedState(searchList: searchList));
    });
  }
}
