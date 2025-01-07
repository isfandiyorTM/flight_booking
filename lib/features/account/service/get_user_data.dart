import 'package:supabase_flutter/supabase_flutter.dart';

Future<Map<String, dynamic>?> getUserData() async {
  final userId = Supabase.instance.client.auth.currentUser?.id;

  if (userId == null) {
    print('User not logged in');
    return null;
  }

  final response = await Supabase.instance.client
      .from('users')
      .select('full_name, email, phone_number, profile_image_url')
      .eq('id', userId)
      .maybeSingle();

  print('Response from Supabase: $response');

  if (response == null) {
    print('No data found or access denied.');
    return null;
  }

  return response;
}
