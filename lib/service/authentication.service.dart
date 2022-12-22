import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nlg_mobile_application/database/supca_client.dart';
import 'package:nlg_mobile_application/routes/app.routes.dart';
import 'package:nlg_mobile_application/service/shared_preferences.service.dart';
import 'package:supabase/supabase.dart';

import '../homePage.dart';

class AuthenticationService {
  // ? Login Service
  Future<String?> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Pref pref = Pref();
      AuthResponse response = await SupaBaseHandler.client.auth
          .signInWithPassword(email: email, password: password);

      final Session? session = response.session;
      final User? user = response.user;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(user!.email!),
      //   ),
      // );
      if (user != null) {
        pref.setAccessTokenFromPreferences(session!.accessToken);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
      }
    } on AuthException catch (error) {
      // Get.snackbar('Login Failed', error.message,
      //     snackPosition: SnackPosition.BOTTOM);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await SupaBaseHandler.client.auth.signOut();
    // then(
    //       (value) => Get.snackbar('Logout', 'Successfully Logout',
    //           snackPosition: SnackPosition.BOTTOM),
    //     );
  }
}
