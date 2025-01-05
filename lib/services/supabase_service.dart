import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late SupabaseClient supabaseClient;

Future<void> supabaseServiceInit() async {
  await dotenv.load(fileName: '.env');
  supabaseClient = (await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  ))
      .client;
}
