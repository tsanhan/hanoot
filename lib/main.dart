import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/presentation/screens/MainScreen.dart';

import 'services/test_services.dart';


void main() => runApp(MyApp());
//AIzaSyBN-EWWbmlw9KJwvK19439tLdSTcyTvOPA
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('he', 'he_HE')
          // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        initialRoute: MainScreen.SCREEN_NAME,
        routes: {
          MainScreen.SCREEN_NAME: (context) => MainScreen(),
        });
  } //
}
