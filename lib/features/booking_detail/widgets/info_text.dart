import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      AppTexts.rescheduling.tr(),
      style: const TextStyle(
        color: AppColors.textGray,
        fontSize: 12,
      ),
    );
  }
}
