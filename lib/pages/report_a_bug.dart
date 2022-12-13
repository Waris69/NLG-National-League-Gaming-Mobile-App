import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlg_mobile_application/components/custom_button.dart';
import 'package:nlg_mobile_application/components/input_components.dart';

import '../components/page_header.dart';
import '../components/side_bar.dart';
import '../utils/custom_bottom_navigation_bar.dart';

class ReportBugPage extends StatefulWidget {
  const ReportBugPage({super.key});

  @override
  State<ReportBugPage> createState() => _ReportBugPageState();
}

class _ReportBugPageState extends State<ReportBugPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int grpValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      extendBody: true,
      backgroundColor: const Color(0xff020523),
      bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xff000423),
        child: const SideMenuBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Report A Bug',
                      style: GoogleFonts.raleway(
                        letterSpacing: 1,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Facing any issues? Just inform us Now!',
                      style: GoogleFonts.raleway(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              textfield('First Name'),
              textfield('Email'),
              textfield('Where was this bug found?'),
              textfield('Device Used'),
              textfield('Operating System'),
              textfield('Details'),

              // ? Radio Buttons
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Severity Of Bug',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: const Color(0xffB00B0E),
                              groupValue: grpValue,
                              onChanged: (value) {
                                setState(() {
                                  grpValue = value!;
                                });
                              },
                            ),
                            Text(
                              'Critical',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: const Color(0xffB00B0E),
                              groupValue: grpValue,
                              onChanged: (value) {
                                setState(() {
                                  grpValue = value!;
                                });
                              },
                            ),
                            Text(
                              'Major',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              activeColor: const Color(0xffB00B0E),
                              groupValue: grpValue,
                              onChanged: (value) {
                                setState(() {
                                  grpValue = value!;
                                });
                              },
                            ),
                            Text(
                              'Minor',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ? Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomButton(text: 'Submit'),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  textfield(String lable) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InputComponent(
        placeholder: lable,
        changeStyle: false,
      ),
    );
  }
}
