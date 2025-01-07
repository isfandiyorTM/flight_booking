import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../addBaggageBottomSheet.dart';
import 'package:easy_localization/easy_localization.dart';

class FacilitySection extends StatelessWidget {
  const FacilitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.baggage.tr(),
                style: const TextStyle(
                  color: AppColors.textBlack,
                ),
              ),
              Text(
                AppTexts.extraBaggage.tr(),
                style: const TextStyle(
                  color: AppColors.textGray,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.textGray,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return const AddBaggageBottomSheet();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
