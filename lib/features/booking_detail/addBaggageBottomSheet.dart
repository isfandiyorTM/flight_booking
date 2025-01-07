import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/constants/text_strings.dart';
class AddBaggageBottomSheet extends StatefulWidget {
  const AddBaggageBottomSheet({super.key});

  @override
  State<AddBaggageBottomSheet> createState() => _AddBaggageBottomSheetState();
}

class _AddBaggageBottomSheetState extends State<AddBaggageBottomSheet> {
  int _selectedWeight = 5; // Default selected weight in Kg
  final Map<int, int> _baggageOptions = {
    0: 0,
    5: 210000,
    10: 510000,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // Align left
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

           Text(
            AppTexts.addBaggage.tr(),
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Passenger Name
           Text(
            AppTexts.mattMurdock.tr(),
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _baggageOptions.keys.map((weight) {
              final isSelected = _selectedWeight == weight;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedWeight = weight;
                  });
                },
                child: SizedBox(
                  width: 100,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.blue : AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            isSelected ? AppColors.blue : AppColors.borderColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$weight Kg",
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textBlack,
                            fontSize: 18, // Larger font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          weight == 0
                              ? AppTexts.free.tr()
                              : "Rp ${_baggageOptions[weight]!.toString()}",
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textGray,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      AppTexts.mattMurdock.tr(),
                      style: const TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Rp ${_baggageOptions[_selectedWeight]!.toString()}",
                      style: const TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      AppTexts.total.tr(),
                      style: const TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,

                      ),
                    ),
                    Text(
                      "Rp ${_baggageOptions[_selectedWeight]!.toString()}",
                      style: const TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Add Baggage Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle add baggage action
                Navigator.pop(context); // Close bottom sheet
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.add, color: AppColors.white),
              label:  Text(
                AppTexts.addBaggage.tr(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
