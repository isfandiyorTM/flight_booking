import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/route/route_names.dart';
import '../widgets/setting_widget.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool light = true;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.back, size: 30),
            ),
            const SizedBox(height: 30),
            const Text(
              AppTexts.settings,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            const SizedBox(height: 20),
            const Text(
              AppTexts.general,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.language,
              onPressed: ()=> Navigator.pushNamed(context, RouteNames.languageSettings),
            ),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.notificationSettings,
            ),
            SettingWidget(
              icon: Switch(
                  value: light,
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.blue,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  }),
              title: AppTexts.location,
            ),

            const SizedBox(height: 20),
            const Text(
              AppTexts.accountSecurity,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.emailAndMobileNumber,
            ),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.securitySetting,
            ),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.deleteAccount,
            ),

            const SizedBox(height: 20),
            const Text(
              AppTexts.other,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.aboutIndochinaTravelApp,
            ),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.privacyPolicy,
            ),
            SettingWidget(
              icon: const Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.textGray,
              ),
              title: AppTexts.termsAndCondition,
            ),
            SettingWidget(
              icon: const Text(AppTexts.versionOfApp,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),),
              title: AppTexts.rateApp,
            ),
          ],
        ),
      ),
    );
  }
}
