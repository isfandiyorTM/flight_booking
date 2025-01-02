import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed
  });

  Widget? icon;
  String? title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: onPressed,
      trailing: icon,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlack,
        ),
      ).tr(),
      shape: const Border(
          bottom: BorderSide(
            color: AppColors.lightGray,
          )),
    );
  }
}
