part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchUserDataEvent extends SearchEvent {
  final String searchingUser;

  SearchUserDataEvent({required this.searchingUser});
}
