import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:t_store/features/settings/widgets/setting_widget.dart';

import '../../../core/constants/colors.dart';
import '../widgets/notification_setting_widget.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                AppTexts.notificationSettings,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                ),
              ).tr(),
              const SizedBox(height: 20),
              const Text(
                AppTexts.pushNotificationDisabled,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ).tr(),
              Row(
                children: [
                  const Text(
                    AppTexts.toEnableNotification,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray),
                  ).tr(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppTexts.settings,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                      ),
                    ).tr(),
                  )
                ],
              ),
              const SizedBox(height: 10),
              NotificationSettingWidget(title: AppTexts.activity, subTitle:AppTexts.activitySubTitle),
              NotificationSettingWidget(title: AppTexts.specialForYou, subTitle:AppTexts.specialForYouSubtitle),
              NotificationSettingWidget(title: AppTexts.reminders, subTitle:AppTexts.remindersSubtitle),
              NotificationSettingWidget(title: AppTexts.membership, subTitle:AppTexts.membershipSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}

