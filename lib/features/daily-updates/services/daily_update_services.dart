import 'dart:convert';
import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/network_client.dart';
import 'package:classapp/features/daily-updates/model/daily_update_model.dart';
import 'package:http/http.dart' as http;

class DailyUpdateServices {
  Future<List<DailyUpdateModel>> fetchDailyUpdates() async {
    final http.Response? response =
        await NetworkClient().getRequest(path: ApiEndpoints.fetchDailyUpdate);
    List<DailyUpdateModel> dailyUpdates = [];
    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((e) {
        DailyUpdateModel dailyUpdate = DailyUpdateModel.fromJson(e);
        dailyUpdates.add(dailyUpdate);
      });
    }
    return dailyUpdates;
  }
}
