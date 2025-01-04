import 'package:flutter/material.dart';
import 'app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://zemnvugtgajlubhkykky.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InplbW52dWd0Z2FqbHViaGt5a2t5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU5MDg3NTYsImV4cCI6MjA1MTQ4NDc1Nn0.9IBiEovqZ8pKqGOVsP8_H1aW2YPL9sSW6Si-o1-WfbE',
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('vi'),
        Locale('fr'),
        Locale('uz'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}