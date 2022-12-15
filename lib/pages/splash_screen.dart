import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlg_mobile_application/homePage.dart';
import 'package:nlg_mobile_application/pages/login_page.dart';
import 'package:nlg_mobile_application/routes/app.routes.dart';
import 'package:nlg_mobile_application/service/shared_preferences.service.dart';
import 'package:provider/single_child_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? checkToken;
  // ? Check token
  checkAccessToken() async {
    Pref pref = Pref();
    var token = await pref.getAccessTokenFromPreferences();
    // print(token);
    setState(() {
      checkToken = token;
    });
  }

  @override
  void initState() {
    super.initState();

    // ? Check the access token
    checkAccessToken();

    Timer(
      const Duration(seconds: 4),
      () {
        (checkToken == null)
            ? Navigator.pushReplacementNamed(context, AppRoutes.loginRoute)
            : Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff020631),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/nlgRoundLogo.png',
                    height: 100,
                  ),
                ),
                const SpinKitRing(
                  lineWidth: 5,
                  color: Color(0xffB00B0E),
                  size: 100.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Loading...',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
