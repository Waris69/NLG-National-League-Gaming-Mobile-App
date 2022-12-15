import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  // ! Get Access Token From Preferences
  getAccessTokenFromPreferences() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('access_token');
    return token;
  }

  // ! Set Access Token From Preferences
  setAccessTokenFromPreferences(String token) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('access_token', token);
  }

  // ! Remove Access Token From Preferences
  removeAccessTokenFromPreferences() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('access_token');
  }
}
