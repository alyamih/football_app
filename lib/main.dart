import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_app/pages/splash_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  int? initScreen;
  initializeDateFormatting('en_US');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp(
    initScreen: initScreen!,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initScreen});
  final int initScreen;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: SplashPage(initScreen: initScreen),
    );
  }
}
