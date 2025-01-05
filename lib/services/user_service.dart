import 'package:home_mentor/services/supabase_service.dart';

bool userServiceIsLoggedIn() {
  return supabaseClient.auth.currentUser != null;
}
