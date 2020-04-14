import 'package:flutter/material.dart';

import 'services/test_services.dart';


void main() => runApp(MyApp());
//AIzaSyBN-EWWbmlw9KJwvK19439tLdSTcyTvOPA
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body:TestServices())
      ,);
    
  }
}
