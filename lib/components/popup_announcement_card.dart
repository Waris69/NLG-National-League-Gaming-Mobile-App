import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementPopupCard extends StatefulWidget {
  String announcementCardimg, text, icon, description;
  AnnouncementPopupCard({
    super.key,
    required this.announcementCardimg,
    required this.text,
    required this.description,
    required this.icon,
  });

  @override
  State<AnnouncementPopupCard> createState() => _AnnouncementPopupCardState();
}

class _AnnouncementPopupCardState extends State<AnnouncementPopupCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        // height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
            stops: [0.4, 1],
            colors: [
              Color(0xff35479E),
              // Color(0xff35479E),
              Color.fromARGB(207, 63, 33, 122),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
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
                Expanded(
                  child: Text(
                    widget.text.toUpperCase(),
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Text(
                  widget.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
