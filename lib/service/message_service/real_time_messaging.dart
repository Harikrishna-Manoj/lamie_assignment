import 'dart:developer';

import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class RealTimeMessageService {
  sendMessage({required String message, required int receiverId}) async {
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse("${WebSocketUrl.socketUrl}/2/?$receiverId"),
      );
      await channel.ready;

      if (message.isNotEmpty) {
        print("called$receiverId");
        channel.stream.listen((message) {
          channel.sink.add(message);
          channel.sink.close(status.goingAway);
        });
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
