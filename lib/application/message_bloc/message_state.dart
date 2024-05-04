part of 'message_bloc.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageLoadingState extends MessageState {}

final class MessageLoadedState extends MessageState {
  final List<MessageModel> messageList;

  MessageLoadedState({required this.messageList});
}
