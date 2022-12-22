import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key});

  @override
  State<TeamCard> createState() => _TeamCardState();
}

final List myList = [
  {
    'image': 'donald',
    'title': 'Donald Beam \| MS, LPC',
    'desc': 'Behavioral Health Director',
  },
  {
    'image': 'leena',
    'title': 'Leena Sahu',
    'desc': 'Special Events Director',
  },
  {
    'image': 'matthew',
    'title': 'Matthew Beam',
    'desc': 'League Commissioner',
  },
  {
    'image': 'taylor',
    'title': 'Taylor Horwood',
    'desc': 'Technology Director',
  },
  {
    'image': 'aaron',
    'title': 'Aaron York',
    'desc': 'Health Officer',
  },
  {
    'image': 'mike',
    'title': 'Mike Fox',
    'desc': 'Player Experience Director',
  },
];

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffB00B0E),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      'assets/images/${myList[index]['image']}.png',
                      fit: BoxFit.cover,
                      height: 190,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  // ignore: unnecessary_string_escapes
                  '${myList[index]['title']}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '${myList[index]['desc']}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffEE272A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
