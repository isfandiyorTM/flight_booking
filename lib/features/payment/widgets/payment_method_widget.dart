import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class PaymentMethodWidget extends StatelessWidget {
  PaymentMethodWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.trailing,
    this.onPressed,
  });

  String? title;
  String? subTitle;
  Widget? trailing;
  Widget? leading;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
      leading: leading,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlack,
        ),
      ).tr(),
      subtitle: Row(
        children: [
          const Icon(
            CupertinoIcons.checkmark_seal_fill,
            color: AppColors.yellow,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(
            subTitle!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
            overflow: TextOverflow.ellipsis,
          ).tr(),
        ],
      ),
      trailing: trailing,
      shape: const Border(
        bottom: BorderSide(width: 1, color: AppColors.lightGray),
      ),
    );
  }
}
