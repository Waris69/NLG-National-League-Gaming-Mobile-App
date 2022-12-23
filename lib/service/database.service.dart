import 'package:nlg_mobile_application/database/supca_client.dart';
import 'package:supabase/supabase.dart';

import 'shared_preferences.service.dart';

class DatabaseService {
  // ! Fetching Announcements
  Future getAnnouncements() async {
    try {
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

  // ! Fetching Announcements Notification
  Future getAnnouncementsNotification() async {
    try {
      // ? Check token
      Pref pref = Pref();
      var token = await pref.getAccessTokenFromPreferences();

      // ? Making Authorize Client
      SupabaseClient client = SupabaseClient(
        SupaBaseHandler.supaBaseURL,
        SupaBaseHandler.supaBaseKey,
        headers: {
          'apiKey': SupaBaseHandler.supaBaseKey,
          'Authorization': 'Bearer $token',
        },
      );

      // RealtimeChannel announcement =

      print("above client");
      client
          .channel('announcements')
          .on(
            RealtimeListenTypes.postgresChanges,
            ChannelFilter(
                event: 'INSERT', schema: 'public', table: 'announcements'),
            (payload, [ref]) => print('Change received! ${payload.toString()}'),
          )
          .subscribe();

      //         (payload, [ref]) {
      //   print('Change received! $payload');
      // });

      // print("Announcements ${announcements}");
      // // var data = response.data;
      return print("hello");
    } catch (e) {
      print(e.toString());
    }
  }
}
