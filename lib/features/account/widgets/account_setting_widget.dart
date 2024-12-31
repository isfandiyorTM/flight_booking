import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AccountSettingWidget extends StatelessWidget {
  AccountSettingWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  Icon? icon;
  String? title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon!,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_forward,
        color: AppColors.textGray,
      ),
      shape: const Border(
          bottom: BorderSide(
            color: AppColors.lightGray,
          )),
      contentPadding: const EdgeInsets.only(bottom: 10,left: 20,right: 20),
    );
  }
}
