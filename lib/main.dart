import 'package:flutter/material.dart';
import 'package:nlg_mobile_application/homePage.dart';
import 'package:nlg_mobile_application/pages/login_page.dart';
import 'package:nlg_mobile_application/pages/splash_screen.dart';
import 'package:nlg_mobile_application/provider/app.provider.dart';
import 'package:nlg_mobile_application/routes/app.routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProvider.providers, child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splashScreenRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(unselectedWidgetColor: Colors.grey[700]),
      home: const SplashScreen(),
    );
  }
}
