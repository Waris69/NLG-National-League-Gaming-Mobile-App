import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                          fontSize: 22,
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
<<<<<<< Updated upstream
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
=======
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w400,
>>>>>>> Stashed changes
                        ),
                      ),
                    ),
                  ),
                  Padding(
<<<<<<< Updated upstream
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 120,
                      color: Colors.amber,
=======
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              HeroCard(
                                changePosition: false,
                                bg_image: 'OW2_Dream_Defiant_bg',
                                vector: 'OW2_Dream_Defiant_1',
                                text1: 'OVER',
                                text2: 'WATCH',
                              ),
                              HeroCard(
                                changePosition: true,
                                bg_image: 'Rocket_League_Octane_With_Rays_bg',
                                vector: 'Rocket_League_Octane_With_Rays_1',
                                text1: 'Rocket',
                                text2: 'League',
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.07,
                              )
                            ],
                          ),
                        ],
                      ),
>>>>>>> Stashed changes
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: CustomButton(
                      text: 'Submit',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: CustomButton(
                      text: 'SIGN IN',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
