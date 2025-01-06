import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AddBaggageBottomSheet extends StatefulWidget {
  const AddBaggageBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddBaggageBottomSheet> createState() => _AddBaggageBottomSheetState();
}

class _AddBaggageBottomSheetState extends State<AddBaggageBottomSheet> {
  int _selectedWeight = 5; // Default selected weight in Kg
  final Map<int, int> _baggageOptions = {
    0: 0, // 0Kg is free
    5: 210000, // Rp 210.000
    10: 510000, // Rp 510.000
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Indicator
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textGray,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          const Text(
            "Add Baggage",
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Passenger Name
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "1. Matt Murdock",
              style: TextStyle(
                color: AppColors.textBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Baggage Options
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
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.blue : AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.blue : AppColors.borderColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$weight Kg",
                        style: TextStyle(
                          color: isSelected ? AppColors.white : AppColors.textBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        weight == 0 ? "Free" : "Rp ${_baggageOptions[weight]!.toString()}",
                        style: TextStyle(
                          color: isSelected ? AppColors.white : AppColors.textGray,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "1. Matt Murdock",
                      style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Rp 210.000",
                      style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Divider(color: AppColors.borderColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp 210.000",
                      style: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 16,
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
              label: const Text(
                "Add Baggage",
                style: TextStyle(
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
