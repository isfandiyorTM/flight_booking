import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> updateUserData({
  required String fullName,
  required String phoneNumber,
  String? profileImageUrl,
}) async {
  final userId = Supabase.instance.client.auth.currentUser?.id;

  if (userId == null) {
    print('User not logged in');
    return false;
  }

  final data = {
    'full_name': fullName,
    'phone_number': phoneNumber,
  };

  if (profileImageUrl != null) {
    data['profile_image_url'] = profileImageUrl;
  }

  final response = await Supabase.instance.client
      .from('users')
      .update(data)
      .eq('id', userId);

  if (response.error != null) {
    print('Error updating user data: ${response.error!.message}');
    return false;
  }

  return true;
}
