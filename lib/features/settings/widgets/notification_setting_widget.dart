import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/text_strings.dart';
import 'notification_setting_switch_widget.dart';

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
