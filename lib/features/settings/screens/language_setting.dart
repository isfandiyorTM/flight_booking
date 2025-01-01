import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}
class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'en'; // Default language

  // List of supported languages
  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'vi', 'name': 'Vietnamese'},
    {'code': 'fr', 'name': 'French'},
    {'code': 'ru', 'name': 'Russian'},
    {'code': 'uz', 'name': 'Uzbek'},
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize _selectedLanguage with the current locale's language code
    _selectedLanguage = context.locale.languageCode;
  }

  // Function to change the language
  Future<void> _changeLanguage(String languageCode) async {
    await context.setLocale(Locale(languageCode)); // Set the locale dynamically
    setState(() {
      _selectedLanguage = languageCode; // Update the selected language
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language').tr(), // Translation
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language', // This text will be translated dynamically
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ).tr(),
            SizedBox(height: 20),
            // Generate the list of radio buttons dynamically
            ..._languages.map((lang) {
              return RadioListTile<String>(
                title: Text(lang['name']!),
                value: lang['code']!,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  if (value != null) {
                    _changeLanguage(value); // Change the language when selected
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
