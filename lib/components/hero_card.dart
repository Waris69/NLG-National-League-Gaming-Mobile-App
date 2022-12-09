import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroCard extends StatefulWidget {
  HeroCard({Key? key}) : super(key: key);

  @override
  State<HeroCard> createState() => _HeroCardState();
}

final List myList = [
  {
    'changePosition': false,
    'bg_image': 'OW2_Dream_Defiant_bg',
    'vector': 'OW2_Dream_Defiant_1',
    'text1': 'OVER',
    'text2': 'WATCH',
  },
  {
    'changePosition': true,
    'bg_image': 'Rocket_League_Octane_With_Rays_bg',
    'vector': 'Rocket_League_Octane_With_Rays_1',
    'text1': 'Rocket',
    'text2': 'League',
  }
];

class _HeroCardState extends State<HeroCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myList.length,
      itemBuilder: (context, index) => (myList[index]['changePosition'])
          ? Stack(
              alignment: Alignment.bottomRight,
              children: [
                const SizedBox(
                  height: 230,
                ),
                Image.asset(
                  'assets/images/${myList[index]['bg_image']}.png',
                  height: 170,
                  width: 300,
                ),
                Positioned(
                  left: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      '${myList[index]['text1']} \n${myList[index]['text2']}',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -25,
                  right: -20,
                  child: Image.asset(
                    'assets/images/${myList[index]['vector']}.png',
                    height: 220,
                  ),
                ),
              ],
            )
          : Stack(
              alignment: Alignment.bottomRight,
              children: [
                const SizedBox(
                  height: 230,
                ),
                Image.asset(
                  'assets/images/${myList[index]['bg_image']}.png',
                  height: 170,
                  width: 300,
                ),
                Positioned(
                  left: 40,
                  bottom: -2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          '${myList[index]['text1']} \n${myList[index]['text2']}',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        'assets/images/${myList[index]['vector']}.png',
                        height: 220,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
