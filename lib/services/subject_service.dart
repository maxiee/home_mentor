import 'package:home_mentor/services/supabase_service.dart';

Future<bool> subjectServiceCreateSubject(String name) async {
  await supabaseClient.from('subjects').insert({'name': name});
  return true;
}
