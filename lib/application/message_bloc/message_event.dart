part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}

class GetPreviousMessages extends MessageEvent {
  final int receiverId;

  GetPreviousMessages({required this.receiverId});
}

class SendMessageEvent extends MessageEvent {
  final int receiverId;
  final String message;

  SendMessageEvent({required this.receiverId, required this.message});
}
