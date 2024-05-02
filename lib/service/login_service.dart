import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogInService {
  final clinet = http.Client();
  Future<void> userLogIn(
      {required String emailId, required String password}) async {
    final body = {"email": emailId, "password": password};
    try {
      final response = await clinet.post(Uri.parse(UrlClass.logInUrl),
          headers: {}, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        // Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("access_token", result["access"]);
      } else {
        log(response.statusCode.toString());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
