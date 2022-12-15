import 'package:flutter/cupertino.dart';
import 'package:nlg_mobile_application/service/authentication.service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  AuthenticationService authService = AuthenticationService();

  Future<String?> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var response = await authService.signIn(
          email: email, password: password, context: context);
    } catch (e) {
      print(e);
    }
  }
}
