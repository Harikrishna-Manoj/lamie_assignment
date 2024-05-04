import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:lamie_pro/core/model/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviousMessageService {
  final clinet = http.Client();
  getPreviousMessages({required int receiverId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token").toString();
    try {
      final response = await clinet.get(
          Uri.parse(
              "${UrlClass.baseUrl}${UrlClass.previousMessageUrl}/$receiverId/2/"),
          headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer $accessToken",
          });
      if (response.statusCode == 200) {
        log(response.body);
        Iterable result = json.decode(response.body);
        List<MessageModel> messageList = List<MessageModel>.from(
            result.map((model) => MessageModel.fromJson(model)));
        return messageList;
      } else {
        log("statuscode: ${response.statusCode}");
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
