import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class GenderSelection extends StatelessWidget {
  final String gender;
  final ValueChanged<String> onGenderChanged;

  const GenderSelection({
    super.key,
    required this.gender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: AppTexts.male.tr(),
          groupValue: gender,
          onChanged: (String? value) {
            if (value != null) {
              onGenderChanged(value);
            }
          },
          activeColor: AppColors.blue,
        ),
        Text(AppTexts.male.tr(), style: TextStyle(color: AppColors.textBlack)),
        const SizedBox(width: 16),
        Radio<String>(
          value: AppTexts.female.tr(),
          groupValue: gender,
          onChanged: (String? value) {
            if (value != null) {
              onGenderChanged(value);
            }
          },
          activeColor: AppColors.blue,
        ),
         Text(AppTexts.female.tr(), style: TextStyle(color: AppColors.textBlack)),
      ],
    );
  }
}
