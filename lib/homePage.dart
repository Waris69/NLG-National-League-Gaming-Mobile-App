import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlg_mobile_application/components/hero_card.dart';
import 'package:nlg_mobile_application/components/announcement_component.dart';
import 'package:nlg_mobile_application/components/input_components.dart';

import 'components/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff010424),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.85
                  : MediaQuery.of(context).size.height * 2.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  opacity: 0.5,
                  image: AssetImage('assets/images/bg.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 20.0
                            : 60,
                        top: 40.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.70,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Welcome to the National\nLeague Gaming',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Esports for Everyone! ™',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //? Hero cards
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: 210,
                      child: HeroCard(),
                    ),
                  ),

                  // ? Subscription Row
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ninja',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Streaming Now - Game',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffB00B0E),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Following',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ? Announcement Row
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Announcement',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Image.asset(
                              'assets/icons/spark.png',
                              height: 20,
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'see more',
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const AnnouncementCard(),
                ],
              ),
            ),
            const SizedBox(
              height: 600,
              child: AnnouncementCard(),
            ),
            // !Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Column(
            //     children: [
            //       InputComponent(
            //         placeholder: 'First Name',
            //         changeStyle: false,
            //       ),
            //       const SizedBox(
            //         height: 30,
            //       ),
            //       InputComponent(
            //         placeholder: 'Username',
            //         changeStyle: true,
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       InputComponent(
            //         placeholder: 'Password',
            //         changeStyle: true,
            //       ),
            //     ],
            //   ),
            // ),
            // const AnnouncementCard(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            //   child: CustomButton(
            //     text: 'Submit',
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            //   child: CustomButton(
            //     text: 'SIGN IN',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
