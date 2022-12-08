import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroCard extends StatefulWidget {
  String bg_image, vector, text1, text2;
  bool changePosition;

  HeroCard(
      {Key? key,
      required this.bg_image,
      required this.vector,
      required this.text1,
      required this.text2,
      required this.changePosition})
      : super(key: key);

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  @override
  Widget build(BuildContext context) {
    return (widget.changePosition)
        ? Stack(
            alignment: Alignment.bottomRight,
            children: [
              const SizedBox(
                height: 230,
              ),
              Image.asset(
                'assets/images/${widget.bg_image}.png',
                height: 170,
                width: 300,
              ),
              Positioned(
                left: 40,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    '${widget.text1} \n${widget.text2}',
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
                  'assets/images/${widget.vector}.png',
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
                'assets/images/${widget.bg_image}.png',
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
                        '${widget.text1} \n${widget.text2}',
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
                      'assets/images/${widget.vector}.png',
                      height: 220,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
