import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nlg_mobile_application/components/hero_card.dart';
import 'package:nlg_mobile_application/components/announcement_component.dart';
import 'package:nlg_mobile_application/components/side_bar.dart';
import 'package:nlg_mobile_application/components/team_card.dart';
import 'package:nlg_mobile_application/notifier/database.notifier.dart';
import 'package:nlg_mobile_application/routes/app.routes.dart';
import 'package:nlg_mobile_application/utils/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart' as provider;
import 'models/announcement_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.search_outlined,
    Ionicons.logo_microsoft
  ];

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final DatabaseNotifier databaseNotifier =
        provider.Provider.of<DatabaseNotifier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        extendBody: true,
        backgroundColor: const Color(0xff010424),
        bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width,
          backgroundColor: const Color(0xff000423),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/sidebarBackground.png'),
              ),
            ),
            child: const SideMenuBar(),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              opacity: 0.5,
              image: AssetImage('assets/images/bg.png'),
            ),
          ),
          child: ListView(
            children: [
              Column(
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.announcementRoute);
                          },
                          child: Text(
                            'see more',
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const AnnouncementCard(),
                ],
              ),
              SizedBox(
                height: 500,
                child: FutureBuilder<void>(
                  future: databaseNotifier.getAnnouncements(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SpinKitRing(
                        lineWidth: 5,
                        color: Color(0xffB00B0E),
                        size: 70.0,
                      );
                    }
                    if (snapshot.hasData) {
                      List _snapshot = snapshot.data as List;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          Announcement announcement = _snapshot[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.announcementRoute);
                            },
                            child: AnnouncementCard(
                              showDescription: false,
                              announcementCardimg: 'announcementCardKeyboard',
                              text: announcement.title,
                              description: announcement.description,
                              icon: 'cupicon',
                            ),
                          );
                        },
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/serverErrorIcon.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'No data to show',
                          style: GoogleFonts.poppins(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 500,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 5),
              //     child: AnnouncementCard(
              //       announcementCardimg: 'announcementCardKeyboard',
              //       text: 'Spartans vs  Kraken',
              //       icon: 'cupicon',
              //     ),
              //   ),
              // ),

              // ? Start gaming Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff35479E),
                        Color(0xff160F7D),
                      ],
                    ),
                    boxShadow: [
                      for (double i = 1; i < 5; i++)
                        BoxShadow(
                          offset: const Offset(0, 3),
                          color: const Color.fromARGB(97, 73, 17, 170),
                          blurRadius: 6 * i,
                        ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Start gaming',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [Color(0xffED2629), Color(0xffB00B0E)],
                            ),
                            boxShadow: [
                              for (double i = 1; i < 5; i++)
                                const BoxShadow(
                                  // offset: const Offset(0, 3),
                                  color: Color.fromARGB(82, 247, 94, 127),
                                  blurRadius: 10,
                                ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_right_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // ? Meet The Team

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Text(
                      'Meet The Team',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 290,
                  child: TeamCard(),
                ),
              ),

              // ? What we do

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff19245D),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // ? What we do
                        Text(
                          'What We Do',
                          style: GoogleFonts.poppins(
                            letterSpacing: 3,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Workout / Game / Have Fun',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'League Play – Ditch your gym membership! You will be subscribed to our live workout program with access to our entire library of workouts, stretches, posture practices and other information. On top of that, you will have an in-game coach with weekly practices as well as a competitive game schedule. You also are eligible for any free giveaways, school scholarships and access to connect with a life coach to help you with your out of game goals.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),

                        // ? /////////////////////////////////
                        const SizedBox(
                          height: 30.0,
                        ),
                        // ? /////////////////////////////////

                        // ! Second Para

                        // ? Tournaments
                        Text(
                          'Tournaments',
                          style: GoogleFonts.poppins(
                            letterSpacing: 3,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Workout / Game / Have Fun',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Will work just like your regular sports teams league. Get a bunch of friends together, make a team, meet up all at the same house or jump on chat together, sign in and get ready to compete. This is the place where you can continue your esports competitiveness with like-minded people. Play for prizes and other exclusive content! Our adult leagues are tailored for the group of friends who are too busy now. This allows your squad to have a set time a week to get online to play because let’s face it, lives are busy, so when you do get time to game… you don’t waste it on solo queue games with toxic teammates. Sign up, get competitive, play for \$\$\$ and bragging rights! We also will have live trainers throughout each event.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
