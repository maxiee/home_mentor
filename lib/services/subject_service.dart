import 'package:home_mentor/services/supabase_service.dart';

Future<bool> subjectServiceCreateSubject(String name) async {
  await supabaseClient.from('subjects').insert({'name': name});
  return true;
}

Future<List<Map<String, dynamic>>> subjectServiceGetSubjects() async {
  return await supabaseClient.from('subjects').select();
}

Future<void> subjectServiceUpdateBackground(int id, String background) async {
  await supabaseClient
      .from('subjects')
      .update({'background': background}).eq('id', id);
}

Future<void> subjectServiceAddPrompt(
    int subjectId, String promptName, String prompt) async {
  await supabaseClient.from('prompts').insert({
    'subject': subjectId,
    'name': promptName,
    'prompt': prompt,
  });
}
