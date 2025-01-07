import 'package:flutter/material.dart';
import 'package:t_store/core/constants/text_strings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class CountryCodeDropdown extends StatelessWidget {
  const CountryCodeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Country code",
          style: TextStyle(
            color: AppColors.textGray,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.bgLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.ukFlag,
                    width: 32,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppTexts.countryCode.tr(),
                    style: const TextStyle(
                      color: AppColors.textBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textGray,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
