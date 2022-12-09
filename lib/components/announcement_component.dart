import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementCard extends StatefulWidget {
  const AnnouncementCard({super.key});

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  final List<Announcement> myList = [
    Announcement('announcementCardKeyboard', 'Spartans vs  Kraken', 'cupicon'),
    Announcement('announcementCardJoystick', 'Announcement 02', 'hearticon'),
    Announcement('announcementCardKeyboard', 'Announcement 03', 'hearticon'),
    Announcement('announcementCardJoystick', 'Announcement 04', 'hearticon'),

    // {
    //   'announcementCardimg': 'announcementCardKeyboard',
    //   'text': 'Spartans vs  Kraken',
    //   'icon': 'cupicon'
    // },
    // {
    //   'announcementCardimg': 'announcementCardJoystick',
    //   'text': 'Announcement 02',
    //   'icon': 'hearticon'
    // },
    // {
    //   'announcementCardimg': 'announcementCardKeyboard',
    //   'text': 'Announcement 03',
    //   'icon': 'hearticon'
    // },
    // {
    //   'announcementCardimg': 'announcementCardJoystick',
    //   'text': 'Announcement 04',
    //   'icon': 'hearticon'
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  tileMode: TileMode.clamp,
                  colors: [
                    Color(0xff35479E),
                    Color(0xff35479E),
                    Color.fromARGB(87, 63, 33, 122),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            width: 90,
                            decoration: const BoxDecoration(
                              color: Color(0xff140851),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: Image.asset(
                              'assets/images/${myList.map((e) => e.announcementCardimg)}.png',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '${myList.map((e) => e.text)}'.toUpperCase(),
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Read',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/announcementShape.png'),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                              'assets/icons/${myList.map((e) => e.icon)}.png'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // Padding(
    //   padding: const EdgeInsets.all(15.0),
    //   child: Center(
    //     child: Container(
    //       height: 100,
    //       width: MediaQuery.of(context).size.width * 0.85,
    //       decoration: BoxDecoration(
    //         gradient: const LinearGradient(
    //           tileMode: TileMode.clamp,
    //           colors: [
    //             Color(0xff35479E),
    //             Color(0xff35479E),
    //             Color.fromARGB(87, 63, 33, 122),
    //           ],
    //         ),
    //         borderRadius: BorderRadius.circular(16),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(8),
    //               child: Stack(
    //                 alignment: AlignmentDirectional.topEnd,
    //                 children: [
    //                   Container(
    //                     width: 90,
    //                     decoration: const BoxDecoration(
    //                       color: Color(0xff140851),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 15,
    //                     child: Image.asset(
    //                       'assets/images/${announcementCardKeyboard}.png',
    //                       fit: BoxFit.cover,
    //                       width: 100,
    //                       height: 70,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Text(
    //             '${Announcement 03}'.toUpperCase(),
    //             style: GoogleFonts.roboto(
    //                 color: Colors.white,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w900),
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 15),
    //                 child: Text(
    //                   'Read',
    //                   style: GoogleFonts.poppins(
    //                       color: Colors.white,
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w500),
    //                 ),
    //               ),
    //               Container(
    //                 height: 40,
    //                 width: 70,
    //                 decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                     image:
    //                         AssetImage('assets/images/announcementShape.png'),
    //                   ),
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: Image.asset('assets/icons/${hearticon}.png'),
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class Announcement {
  String announcementCardimg;
  String text;
  String icon;

  Announcement(this.announcementCardimg, this.text, this.icon);

  @override
  String toString() {
    return '{ image: ${this.announcementCardimg}, text:${this.text},  icon:${this.icon} }';
  }
}
