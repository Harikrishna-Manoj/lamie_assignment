part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDataLoadingState extends UserState {}

final class UserDataLoadedState extends UserState {
  final List<Connections> userList;

  UserDataLoadedState({required this.userList});
}
