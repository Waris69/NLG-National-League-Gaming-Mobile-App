import 'dart:io';
import 'package:enough_mail/enough_mail.dart';

class EmailService {
  String userName = 'waris.waheed@koredigital.com.pk';
  String password = 'Kore1234@@@';
  String smtpServerHost = 'koretechxhosting.com';
  int smtpServerPort = 465;
  bool isSmtpServerSecure = true;

  // ! Sending SMTP emails

  Future<void> sendEmail({
    firstName,
    lastName,
    email,
    subject,
    message,
  }) async {
    final client =
        SmtpClient('webmail.koretechxhosting.com', isLogEnabled: true);
    try {
      await client.connectToServer(smtpServerHost, smtpServerPort,
          isSecure: isSmtpServerSecure);
      await client.ehlo();
      if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
        await client.authenticate(userName, password, AuthMechanism.plain);
      } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
        await client.authenticate(userName, password, AuthMechanism.login);
      } else {
        return;
      }
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: message,
        htmlText: '<p>$message $email</p>',
      )
        ..from = [
          MailAddress('$firstName $lastName', 'waris.waheed@koredigital.com.pk')
        ]
        ..to = [MailAddress('Waris Waheed', 'emadhsiddiqui@gmail.com')]
        ..subject = subject;
      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      print('message sent');
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
    }
  }
}
