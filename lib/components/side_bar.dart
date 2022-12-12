import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nlg_mobile_application/pages/login_page.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({super.key});

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.75,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/sideMenuImage.png'),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  'LOGOUT',
                  style: GoogleFonts.inter(
                    letterSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
              ),
            ),
            Column(
              children: [
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                menu(Icons.discord, 'Discord'),
                menu(Icons.discord, 'Contact NLG'),
                menu(Icons.discord, 'Report a bug'),
                menu(Icons.discord, 'About App'),
                menu(Icons.discord, 'Daily Helth Quest'),
                menu(Icons.discord, 'Visit Website'),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Ionicons.logo_facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Ionicons.logo_twitter,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Ionicons.logo_instagram,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget menu(icon, menuName) {
  return Padding(
    padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            menuName,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}