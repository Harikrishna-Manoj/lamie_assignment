import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogInService {
  final clinet = http.Client();
  Future<String> userLogIn(
      {required String emailId, required String password}) async {
    final body = {"email": emailId, "password": password};
    try {
      final response = await clinet.post(Uri.parse(UrlClass.logInUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        log(result["access"]);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("access_token", result["access"]);
        String statusCode = response.statusCode.toString();
        log(statusCode);
        return statusCode;
      } else {
        String statusCode = response.statusCode.toString();
        log(statusCode);
        return statusCode;
      }
    } catch (error) {
      log(error.toString());
    }
    return "";
  }
}
