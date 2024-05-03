import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lamie_pro/core/constants/urls/urls.dart';
import 'package:lamie_pro/core/model/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchService {
  final clinet = http.Client();
  searchUser({required String userName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token").toString();
    try {
      final response = await clinet.get(
          Uri.parse("${UrlClass.baseUrl}${UrlClass.searchUrl}$userName"),
          headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer $accessToken",
          });

      if (response.statusCode == 200) {
        Iterable result = json.decode(response.body);
        List<SearchModel> searchList = List<SearchModel>.from(
            result.map((model) => SearchModel.fromJson(model)));
        return searchList;
      } else {}
    } catch (error) {
      log(error.toString());
    }
  }
}
