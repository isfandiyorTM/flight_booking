import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/core/constants/text_strings.dart';

import '../../../core/constants/colors.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'en';

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'vi', 'name': 'Tiếng Việt'},
    {'code': 'fr', 'name': 'Français'},
    {'code': 'ru', 'name': 'Русский'},
    {'code': 'uz', 'name': "O'zbek"},
  ];

  // Function to change the language
  void _changeLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
    });
    context.setLocale(Locale(languageCode));
    Get.updateLocale(Locale(languageCode));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.back, size: 30),
            ),
            const SizedBox(height: 30),
            const Text(
              AppTexts.language,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            const SizedBox(height: 20),
            ..._languages.map((lang) {
              return Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: AppColors.lightGray,
                        ))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang['name']!,style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlack,
                    ),),
                    Radio<String>(
                      value: lang['code']!,
                      groupValue: _selectedLanguage,
                      onChanged: (value) {
                        if (value != null) {
                          _changeLanguage(value);
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
