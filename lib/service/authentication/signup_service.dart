import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';

class UserSignUpService {
  final clinet = http.Client();
  Future<(String resultText, String resultStatusCode)?> userSignUp(
      {required String emailId,
      required String userName,
      required String password,
      required String confirmPassword,
      required bool isGoggle}) async {
    final body = {
      "email": emailId, //string
      "username": userName, // string
      "password": password, // string
      "password2": confirmPassword, // string
      "is_google": isGoggle //boolianfield
    };
    try {
      final response = await clinet.post(
          Uri.parse("${UrlClass.baseUrl}${UrlClass.signUpUrl}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        return (result["Text"].toString(), result["status"].toString());
      } else {
        log(response.statusCode.toString());
      }
    } catch (error) {
      log(error.toString());
    }
    return ("Somthing went wrong", "");
  }
}
