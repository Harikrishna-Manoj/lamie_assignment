import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/core/model/message_model.dart';
import 'package:lamie_pro/service/message_service/previous_message_service.dart';
import 'package:lamie_pro/service/message_service/real_time_messaging.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitial()) {
    on<GetPreviousMessages>((event, emit) async {
      emit(MessageLoadingState());
      List<MessageModel> messageList = await PreviousMessageService()
          .getPreviousMessages(receiverId: event.receiverId);
      emit(MessageLoadedState(messageList: messageList));
    });
    on<SendMessageEvent>((event, emit) {
      RealTimeMessageService()
          .sendMessage(message: event.message, receiverId: event.receiverId);
    });
  }
}
