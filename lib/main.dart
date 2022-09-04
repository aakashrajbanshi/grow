import 'package:classapp/app/routes/route_handler.dart';
import 'package:classapp/app/routes/routes.dart';
import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/locator.dart';
import 'package:classapp/providers/auth_provider.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  String? token =
      locator.get<SharedPreferences>().getString(AppConstants.token);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
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
    final appTheme = Provider.of<ThemeProvider>(context);
    final appLocale = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: "Grow Teamly",
      navigatorKey: AppSettings.navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ne', ''), // Nepali, no country code
      ],
      locale: appLocale.currentLocale,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: token != null ? AppRoutes.homeRoute : AppRoutes.loginRoute,
      debugShowCheckedModeBanner: false,
      theme: appTheme.currentTheme,
    );
  }
}

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
