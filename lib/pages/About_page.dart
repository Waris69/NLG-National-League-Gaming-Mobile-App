import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlg_mobile_application/components/custom_button.dart';

import '../components/page_header.dart';
import '../components/side_bar.dart';
import '../utils/custom_bottom_navigation_bar.dart';

class About extends StatelessWidget {
  About({super.key});
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      extendBody: true,
      backgroundColor: const Color(0xff020523),
      bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xff000423),
        child:
            // const SideMenuBar(),
            Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/sidebarBackground.png'),
            ),
          ),
          child: const SideMenuBar(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PageHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'About App',
                    style: GoogleFonts.raleway(
                      letterSpacing: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'National League Gaming',
                    style: GoogleFonts.raleway(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.underline,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Terms & Condition',
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.underline,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Legal Notice',
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.underline,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'About app',
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.underline,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
