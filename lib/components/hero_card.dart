import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroCard extends StatefulWidget {
  String bg_image, vector, text1, text2;
  HeroCard(
      {super.key,
      required this.bg_image,
      required this.vector,
      required this.text1,
      required this.text2});

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          const SizedBox(
            height: 230,
          ),
          Image.asset(
            'assets/images/${widget.bg_image}.png',
            height: 170,
          ),
          Positioned(
            bottom: -2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      '${widget.text1} \n${widget.text2}',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/images/${widget.vector}.png',
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
