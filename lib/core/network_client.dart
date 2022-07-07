import 'dart:developer';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/header.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/locator.dart';
import 'package:classapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  //to centralize get request
  Future<http.Response?> getRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path}) async {
    //response could be null and non null, so we make it nullable at the beginning.
    http.Response? response;
    //try and catch block for exception handling
    try {
      response = await http.get(
        Uri.parse(baseUrl + path),
        headers: getHeader(),
      );
      // if statuscode of response is 200,then set the response body in shared preferences as cache.
      if (response.statusCode == 200) {
        locator.get<SharedPreferences>().setString(path, response.body);
      }
    } catch (e) {
      // check if there's chached rwesponse in shared preferences.
      final _cacheValue = locator<SharedPreferences>().getString(path);
      // if there's is something, return it as response.
      if (_cacheValue != null) {
        response = http.Response(_cacheValue, 200);
      }
      AppSnacks.showSnackBar(AppSettings.navigatorKey.currentContext!,
          message: "something went wrong");
      print(e.toString());
    }
    log(response != null ? response.statusCode.toString() : "response is null");
    return response;
  }

  //to centralize post request
  Future<http.Response?> postRequest({
    String baseUrl = ApiEndpoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
  }) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(baseUrl + path),
        headers: getHeader(),
        body: body,
      );
    } catch (e) {
      print(e.toString());
    }
    log(response != null ? response.statusCode.toString() : "response is null");

    return response;
  }
}
