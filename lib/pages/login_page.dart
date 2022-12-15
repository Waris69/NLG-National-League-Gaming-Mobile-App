import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nlg_mobile_application/components/custom_button.dart';
import 'package:nlg_mobile_application/components/input_components.dart';
import 'package:nlg_mobile_application/notifier/authentication.notifier.dart';
import 'package:provider/provider.dart' as provider;
import 'package:supabase/supabase.dart';

import '../service/authentication.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        provider.Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xff000424),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/loginImage.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1],
                        colors: [
                          Colors.transparent,
                          Color(0xff000424),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: MediaQuery.of(context).size.width * 0.70,
                      ),
                    ),
                  ),
                ],
              ),

              //? Sign in Heading
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 70.0, vertical: 10.0),
                child: Column(
                  children: [
                    Text(
                      'SIGN IN',
                      style: GoogleFonts.raleway(
                        letterSpacing: 3,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),

              //? Input feilds

              Column(
                children: [
                  textfield('Username', usernameController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  textfield('Password', passwordController),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remember Me',
                          style: GoogleFonts.inter(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Forgot Password',
                          style: GoogleFonts.inter(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      onTap: () async {
                        String email = usernameController.text;
                        String password = passwordController.text;

                        if (email.isNotEmpty && password.isNotEmpty) {
                          await authenticationNotifier.signIn(
                              context: context,
                              email: email,
                              password: password);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fill the Credentials'),
                            ),
                          );
                        }
                      },
                      child: CustomButton(text: 'Sign In'),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_pin_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Create an account',
                              style: GoogleFonts.inter(
                                decoration: TextDecoration.underline,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_right_alt_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Continue as a guest',
                              style: GoogleFonts.inter(
                                decoration: TextDecoration.underline,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ? Discort & Twitch Button

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: const Color(0xffB00B0E),
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Ionicons.logo_discord,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Discord',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      color: const Color(0xff35479E),
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Ionicons.logo_twitch,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Twitch',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //? Extra Links

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Terms & Condition',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Legal Notice',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'About app',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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

  textfield(String lable, _controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InputComponent(
        controller: _controller,
        placeholder: lable,
        changeStyle: true,
      ),
    );
  }
}
