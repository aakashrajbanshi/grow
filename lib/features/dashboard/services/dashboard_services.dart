import 'dart:convert';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/network_client.dart';
import 'package:classapp/features/dashboard/model/dashboard_card_model.dart';
import 'package:http/http.dart';

class DashboardServices {
  //to fetch card data from dashboard
  Future<DashboardCardModel?> fetchDashboardCardData() async {
    final Response? response =
        await NetworkClient().getRequest(path: ApiEndpoints.dashboardCardData);
    DashboardCardModel? dashboardCardModel;
    //if response is not null and there's data present
    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dashboardCardModel = DashboardCardModel.fromJson(jsonResponse);
    } else {
      dashboardCardModel = null;
    }
    return dashboardCardModel;
  }
}
