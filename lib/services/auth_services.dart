import 'dart:convert';
import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/header.dart';
import 'package:classapp/core/network_client.dart';
import 'package:http/http.dart' as http;

import '../models/login_response_model.dart';

class AuthServices {
  Future<LoginResponseModel?> login(String username, String password) async {
    final http.Response? response = await NetworkClient().postRequest(
        path: ApiEndpoints.login,
        body: {"username": username, "password": password});
    LoginResponseModel? model;
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(response.body);
      model = LoginResponseModel.fromJson(json);
    }
    return model;
  }
}
