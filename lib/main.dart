import 'package:classapp/app/route_handler.dart';
import 'package:classapp/app/routes.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/locator.dart';
import 'package:classapp/providers/auth_provider.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  String? token =
      locator.get<SharedPreferences>().getString(AppConstants.token);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider())
    ],
    child: MyApp(
      token: token,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grow Teamly",
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: token != null ? AppRoutes.homeRoute : AppRoutes.loginRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
