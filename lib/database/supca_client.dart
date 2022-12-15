import 'package:supabase/supabase.dart';

class SupaBaseHandler {
  static String supaBaseURL = "https://cmsftmdvxihqfltegktp.supabase.co";
  static String supaBaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNtc2Z0bWR2eGlocWZsdGVna3RwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjU1ODg5NjEsImV4cCI6MTk4MTE2NDk2MX0.wCQtfOFGvpkCaLa0KIKck65JUIf8JZzp5KtzyKxatO0";

  static SupabaseClient client = SupabaseClient(supaBaseURL, supaBaseKey);
}
