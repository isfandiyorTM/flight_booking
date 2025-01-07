import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class ExtraProtectionSection extends StatelessWidget {
  const ExtraProtectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.shield_tick5,
                    color: AppColors.blue,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppTexts.travelInsurance.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              Text(
                AppTexts.travelInsurancePrice.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Features List
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeatureRow(
                text: AppTexts.travelCoverage.tr(),
              ),
              const SizedBox(height: 8),
              FeatureRow(
                text: AppTexts.travelCoverage1.tr(),
              )
            ],
          ),
          const SizedBox(height: 16),
          // Centered Add Insurance Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: AppColors.blue,
              ),
              label:  Text(
                AppTexts.addInsurance.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textBlack,
                backgroundColor: AppColors.bgLight,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String text;

  const FeatureRow({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: AppColors.blue,
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
