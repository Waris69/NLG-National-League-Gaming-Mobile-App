import 'package:flutter/material.dart';
import 'package:nlg_mobile_application/homePage.dart';
import 'package:nlg_mobile_application/pages/login_page.dart';
import 'package:nlg_mobile_application/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(unselectedWidgetColor: Colors.grey[700]),
      home: const SplashScreen(),
    );
  }
}
