import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nlg_mobile_application/service/email.service.dart';
import '../components/custom_button.dart';
import '../components/input_components.dart';
import '../components/page_header.dart';
import '../components/side_bar.dart';
import '../utils/custom_bottom_navigation_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String userName = 'waris.waheed@koredigital.com.pk';
    // String password = 'Kore1234@@@';
    // String smtpServerHost = 'koretechxhosting.com';
    // int smtpServerPort = 465;
    // bool isSmtpServerSecure = true;

    // Future<void> sendEmail() async {
    //   final client =
    //       SmtpClient('webmail.koretechxhosting.com', isLogEnabled: true);
    //   try {
    //     await client.connectToServer(smtpServerHost, smtpServerPort,
    //         isSecure: isSmtpServerSecure);
    //     await client.ehlo();
    //     if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
    //       await client.authenticate(userName, password, AuthMechanism.plain);
    //     } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
    //       await client.authenticate(userName, password, AuthMechanism.login);
    //     } else {
    //       return;
    //     }
    //     final builder = MessageBuilder.prepareMultipartAlternativeMessage(
    //       plainText: messageController.text,
    //       htmlText:
    //           '<marquee>${messageController.text}</br>${emailController.text}</marquee>',
    //     )
    //       ..from = [
    //         MailAddress(
    //             '${firstNameController.text} ${lastNameController.text}',
    //             'waris.waheed@koredigital.com.pk')
    //       ]
    //       ..to = [MailAddress('Waris Waheed', 'wariswaheed69@gmail.com')]
    //       ..subject = subjectController.text;
    //     final mimeMessage = builder.buildMimeMessage();
    //     final sendResponse = await client.sendMessage(mimeMessage);
    //     print('message sent');
    //   } on SmtpException catch (e) {
    //     print('SMTP failed with $e');
    //   }
    // }

    clear() {
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    }

    EmailService emailService = EmailService();

    return Scaffold(
      key: _globalKey,
      extendBody: true,
      backgroundColor: const Color(0xff020523),
      bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xff000423),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/sideMenuImage.png'),
            ),
          ),
          child: const SideMenuBar(),
        ),
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
                      'Contact Us',
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
                      'Have any questions? Just send us a message!',
                      style: GoogleFonts.raleway(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              textfield('First Name', firstNameController),
              textfield('Last Name', lastNameController),
              textfield('Email', emailController),
              textfield('Subject', subjectController),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                      controller: messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ? Button
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => const SpinKitRing(
                        lineWidth: 5,
                        color: Color(0xffB00B0E),
                        size: 70.0,
                      ),
                    );
                    // await sendEmail();
                    await emailService.sendEmail(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      subject: subjectController.text,
                      message: messageController.text,
                    );

                    clear();
                    Navigator.pop(context);
                  },
                  child: CustomButton(text: 'Submit'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Ionicons.logo_facebook,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Ionicons.logo_twitter,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Ionicons.logo_instagram,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
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
        changeStyle: false,
      ),
    );
  }
}
