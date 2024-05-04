import 'dart:convert';
import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGoogleSignIn {
  final clinet = http.Client();

  Future<(String resultText, String resultStatusCode)> googleSignIn() async {
    final (String email, String accessToken) = await getAccessToken();
    final body = {'email': email, "access_token": accessToken};
    try {
      final response = await clinet.post(
        Uri.parse("${UrlClass.baseUrl}${UrlClass.googleLogIn}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("access_token", result["token"]["access"]);
        log(prefs.getString("access_token").toString());
        log(result.toString());
        return (response.statusCode.toString(), result["message"].toString());
      }
    } catch (error) {
      log(error.toString());
    }
    return ("Something went wrong", '');
  }

  Future<(String, String)> getAccessToken() async {
    try {
      final googleSignIn = GoogleSignIn();

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return ('', '');
      final googleAuth = await googleUser.authentication;
      String emailId = googleUser.email;

      log(googleAuth.idToken.toString());
      log(googleAuth.accessToken.toString());
      return (emailId, googleAuth.accessToken.toString());
    } catch (error) {
      log(error.toString());
    }
    return ('Something went wrong', '');
  }
}
