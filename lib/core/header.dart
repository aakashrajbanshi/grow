import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> getHeader() {
  //if user is not logged in, the default header is this.
  Map<String, String> header = {"Accept": "application/json"};
  // Check if user is logged in by checking if there is any token saved in shared preferences
  String? token = locator<SharedPreferences>().getString(AppConstants.token);
  //if token is not null, then we should add authorization header only in this condition
  if (token != null) {
    Map<String, String> authorizationHeader = {
      "Authorization": "Bearer $token"
    };
    header.addAll(authorizationHeader);
    //when headers are added, then they are in this form /
    //{
    //"Authorization": "Bearer token"
    // }
  }
  return header;
}
