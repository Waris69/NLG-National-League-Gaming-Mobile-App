import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  String text;
  Function()? onTap;
  CustomButton({super.key, required this.text, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: (widget.text == 'Submit') ? 40 : 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffB00B0E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
