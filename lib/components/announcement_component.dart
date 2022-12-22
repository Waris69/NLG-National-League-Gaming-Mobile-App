import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementCard extends StatefulWidget {
  String announcementCardimg, text, icon, description;
  bool showDescription;
  AnnouncementCard({
    super.key,
    required this.announcementCardimg,
    required this.text,
    required this.description,
    required this.icon,
    required this.showDescription,
  });

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  // List<Announcement> myList = [
  //   Announcement(
  //       announcementCardimg: 'announcementCardKeyboard',
  //       text: 'Spartans vs  Kraken',
  //       icon: 'cupicon'),
  // Announcement(
  //     announcementCardimg: 'announcementCardJoystick',
  //     text: 'Announcement 02',
  //     icon: 'hearticon'),
  // Announcement(
  //     announcementCardimg: 'announcementCardKeyboard',
  //     text: 'Announcement 03',
  //     icon: 'hearticon'),
  // Announcement(
  //     announcementCardimg: 'announcementCardJoystick',
  //     text: 'Announcement 04',
  //     icon: 'hearticon'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Center(
        child: Container(
          height: 100,
          width: double.infinity,
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
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xff140851),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        child: Image.asset(
                          'assets/images/${widget.announcementCardimg}.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              (widget.showDescription)
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text.toUpperCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              widget.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Text(
                        widget.text.toUpperCase(),
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
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
                        image:
                            AssetImage('assets/images/announcementShape.png'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset('assets/icons/${widget.icon}.png'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    // ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: myList.length,
    //   itemBuilder: (context, index) => Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //     child: Center(
    //       child: Container(
    //         height: 100,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           gradient: const LinearGradient(
    //             tileMode: TileMode.clamp,
    //             colors: [
    //               Color(0xff35479E),
    //               Color(0xff35479E),
    //               Color.fromARGB(87, 63, 33, 122),
    //             ],
    //           ),
    //           borderRadius: BorderRadius.circular(16),
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(8),
    //                 child: Stack(
    //                   alignment: AlignmentDirectional.topEnd,
    //                   children: [
    //                     Container(
    //                       width: 80,
    //                       decoration: const BoxDecoration(
    //                         color: Color(0xff140851),
    //                       ),
    //                     ),
    //                     Positioned(
    //                       left: 15,
    //                       child: Image.asset(
    //                         'assets/images/${myList[index].announcementCardimg}.png',
    //                         fit: BoxFit.cover,
    //                         width: 100,
    //                         height: 70,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 15,
    //             ),
    //             Expanded(
    //               child: Text(
    //                 myList[index].text.toUpperCase(),
    //                 style: GoogleFonts.roboto(
    //                     color: Colors.white,
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.w900),
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 15),
    //                   child: Text(
    //                     'Read',
    //                     style: GoogleFonts.poppins(
    //                         color: Colors.white,
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w500),
    //                   ),
    //                 ),
    //                 Container(
    //                   height: 40,
    //                   width: 70,
    //                   decoration: const BoxDecoration(
    //                     image: DecorationImage(
    //                       image:
    //                           AssetImage('assets/images/announcementShape.png'),
    //                     ),
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(left: 10),
    //                     child: Image.asset(
    //                         'assets/icons/${myList[index].icon}.png'),
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    // ? Padding(
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

// class Announcement {
//   String announcementCardimg;
//   String text;
//   String icon;
//   Announcement(
//       {required this.announcementCardimg,
//       required this.text,
//       required this.icon});
  // @override
  // String toString() {
  //   return '{ image: ${this.announcementCardimg}, text:${this.text},  icon:${this.icon} }';
  // }
// }
