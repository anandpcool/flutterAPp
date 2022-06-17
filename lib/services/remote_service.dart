import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iboss_flutter/model/credit_review_response.dart';
import 'package:iboss_flutter/utils/user_simple_preferences.dart';

class RemoteService {
  String tokenUrl = "http://203.112.132.93:8023/authenticate";
  String baseUrl = "http://203.112.132.93:8023/Execute";
  final pref = UserSimplePreferences();
  HashMap<String, String> headers = HashMap();

  Future<String> loginApi(Map<String, String> map, BuildContext context) async {
    var response = await http.post(
        Uri.parse(
          tokenUrl,
        ),
        body: json.encode(map),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200 || response.statusCode == 400) {
      // var jsonData = json.decode(response.body);
      return response.body;
    } else {
      /* ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Some things went wrong")));*/
      throw Exception("Failed to load data");
    }
  }

  Future<dynamic> postRequest(HashMap<String, dynamic> map) async {
    Uri uri = Uri.parse(baseUrl);
    if (UserSimplePreferences.getToken().isNotEmpty) {
      headers["Authorization"] = "Bearer ${UserSimplePreferences.getToken()}";
    }
    headers["content-type"] = "application/json";

    var creditResponse =
        await http.post(uri, body: jsonEncode(map), headers: headers);
    print("Response Data====>${creditResponse.body}");

    if (creditResponse.statusCode == 200) {

      return creditResponse.body;
    } else if (creditResponse.statusCode == 401) {
      print("Some things went wrong");
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<dynamic> creditReviewList(HashMap<String, dynamic> map) async {
    Future<dynamic> responseData = postRequest(map);
    return responseData;
  }

   Future<dynamic> branchList(HashMap<String, dynamic> map) async {
    Future<dynamic> responseData = postRequest(map);
    return responseData;
  }
}
