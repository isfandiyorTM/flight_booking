import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../addBaggageBottomSheet.dart';

class FacilitySection extends StatelessWidget {
  const FacilitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white, // Background color from AppColors
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: AppColors.borderColor), // Border color from AppColors
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baggage",
                style: TextStyle(
                  color: AppColors.textBlack, // Text color from AppColors
                ),
              ),
              Text(
                "Add extra baggage",
                style: TextStyle(
                  color: AppColors.textGray,
                  // Subtitle text color from AppColors
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
