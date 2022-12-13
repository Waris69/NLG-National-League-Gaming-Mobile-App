import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class InputComponent extends StatefulWidget {
  String placeholder;
  bool changeStyle;
  InputComponent({
    super.key,
    required this.placeholder,
    required this.changeStyle,
  });

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  TextEditingController _controller = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: (widget.changeStyle)
          ? TextField(
              controller: _controller,
              style: GoogleFonts.inter(
                color: Colors.white,
              ),
              obscureText: (widget.placeholder == 'Password')
                  ? (showPassword)
                      ? false
                      : true
                  : false,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffB00B0E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffB00B0E)),
                ),
                prefixIcon: Icon(
                  (widget.placeholder == 'Username')
                      ? Ionicons.person_outline
                      : Icons.lock_outline,
                  color: Colors.white,
                ),
                suffixIcon: Visibility(
                    visible: (widget.placeholder == 'Password'),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                        showPassword
                            ? Ionicons.eye_outline
                            : Ionicons.eye_off_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    )),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: widget.placeholder,
                hintStyle: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            )
          : TextField(
              controller: _controller,
              style: GoogleFonts.inter(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: widget.placeholder,
                hintStyle: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
