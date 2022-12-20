import 'package:nlg_mobile_application/components/announcement_component.dart';
import 'package:nlg_mobile_application/homePage.dart';
import 'package:nlg_mobile_application/pages/announcements_page.dart';
import 'package:nlg_mobile_application/pages/login_page.dart';
import 'package:nlg_mobile_application/pages/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = "/splashscreen";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String announcementRoute = "/announcement";

  static final routes = {
    splashScreenRoute: (context) => const SplashScreen(),
    loginRoute: (context) => const LoginPage(),
    homeRoute: (context) => const HomePage(),
    announcementRoute: (context) => const AnnouncementPage(),
  };
}
