import 'package:classapp/app/routes.dart';
import 'package:classapp/features/daily-updates/views/add_daily_updates_view.dart';
import 'package:classapp/models/dummy_page_model.dart';
import 'package:classapp/pages/dummy_page.dart';
import 'package:classapp/pages/home_page.dart';
import 'package:classapp/pages/login_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AppRoutes.addDailyUpdateRoute:
        return MaterialPageRoute(
            builder: (context) => const AddDailyUpdateView());
      case AppRoutes.dummyRoute:
        return MaterialPageRoute(
            builder: (context) => DummyPage(
                  data: arguments as DummyPageModel,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}
