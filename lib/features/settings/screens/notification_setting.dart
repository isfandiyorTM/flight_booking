import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:t_store/features/settings/widgets/setting_widget.dart';

import '../../../core/constants/colors.dart';

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
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back, size: 30),
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
class NotificationSettingWidget extends StatelessWidget {
  NotificationSettingWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ).tr(),
        const SizedBox(height: 8),
        Text(
          subTitle!,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray),
        ).tr(),
        NotificationSettingSwitchWidget(title: AppTexts.emailCapitalize),
        NotificationSettingSwitchWidget(title: AppTexts.pushNotification),
        const SizedBox(height: 30),
      ],
    );
  }
}

class NotificationSettingSwitchWidget extends StatefulWidget {
  NotificationSettingSwitchWidget({
    super.key,
    required this.title,
  });

  String? title;
  bool light = true;

  @override
  State<NotificationSettingSwitchWidget> createState() => _NotificationSettingSwitchWidgetState();
}

class _NotificationSettingSwitchWidgetState extends State<NotificationSettingSwitchWidget> {
  @override
  Widget build(BuildContext context) {

    return  ListTile(
      trailing: Theme(
        data: ThemeData(
          useMaterial3: true,
        ).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(outline: Colors.white),
        ),
        child: Switch(
          value: widget.light,
          activeTrackColor: AppColors.blue,
          inactiveTrackColor: AppColors.lightGray,
          inactiveThumbColor: AppColors.white,
          onChanged: (value) => setState(() => widget.light = !value),
        ),
      ),
      title:  Text(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlack,
        ),
        widget.title!,
      ).tr(),
      shape: const Border(
          bottom: BorderSide(
            color: AppColors.lightGray,
          )),
    );
  }
}
