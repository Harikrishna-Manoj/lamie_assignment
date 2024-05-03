part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchUserDataLoadingState extends SearchState {}

final class SearchUserDataLoadedState extends SearchState {
  final List<SearchModel> searchList;

  SearchUserDataLoadedState({required this.searchList});
}
