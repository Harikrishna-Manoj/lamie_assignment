import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';

class UserGoogleSignIn {
  final clinet = http.Client();

  googleSignIn({required String emailId}) async {
    final body = {'email': emailId};
    try {
      final response = await clinet.post(
        Uri.parse(UrlClass.googleLogIn),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
    } catch (error) {
      log(error.toString());
    }
  }
}
