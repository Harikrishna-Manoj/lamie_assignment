import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:lamie_pro/core/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final clinet = http.Client();

  getAllUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token").toString();
    try {
      final response = await clinet
          .get(Uri.parse("${UrlClass.userDataFetchUrl}2/"), headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer $accessToken",
      });
      if (response.statusCode == 200) {
        UserModel users = UserModel.fromJson(jsonDecode(response.body));
        List<Connections>? userConnectionList = users.connections;
        log(users.connections!.length.toString());
        log(jsonDecode(response.body).toString());
        return userConnectionList;
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
