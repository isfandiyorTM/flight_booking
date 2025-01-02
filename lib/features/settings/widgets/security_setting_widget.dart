import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/text_strings.dart';
import 'notification_setting_switch_widget.dart';

class SecuritySettingWidget extends StatelessWidget {
  SecuritySettingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trailing
  });

  String? title;
  String? subTitle;
  Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title:  Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlack,
        ),
      ).tr(),
      subtitle: Text(
        subTitle!,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textGray,
        ),
      ).tr(),
      trailing: trailing,
      shape: const Border(
          bottom:
          BorderSide(width: 1, color: AppColors.lightGray)),
    );
  }
}
