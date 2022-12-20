import 'package:nlg_mobile_application/database/supca_client.dart';
import 'package:supabase/supabase.dart';

import 'shared_preferences.service.dart';

class DatabaseService {
  // ! Fetching Announcements
  Future getAnnouncements() async {
    try {
      String? checkToken;
      // ? Check token
      Pref pref = Pref();
      var token = await pref.getAccessTokenFromPreferences();

      SupabaseClient client = SupabaseClient(
        SupaBaseHandler.supaBaseURL,
        SupaBaseHandler.supaBaseKey,
        headers: {
          'apiKey': SupaBaseHandler.supaBaseKey,
          'Authorization': 'Bearer $token',
        },
      );

      PostgrestResponse<dynamic> response =
          // ignore: deprecated_member_use
          await client.from('announcements').select().execute();
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  // ! Fetching Daily Health Quest
  Future getDailyHealthQuest() async {
    try {
      String? checkToken;
      // ? Check token
      Pref pref = Pref();
      var token = await pref.getAccessTokenFromPreferences();

      SupabaseClient client = SupabaseClient(
        SupaBaseHandler.supaBaseURL,
        SupaBaseHandler.supaBaseKey,
        headers: {
          'apiKey': SupaBaseHandler.supaBaseKey,
          'Authorization': 'Bearer $token',
        },
      );

      PostgrestResponse<dynamic> response =
          // ignore: deprecated_member_use
          await client.from('quest').select().execute();
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
