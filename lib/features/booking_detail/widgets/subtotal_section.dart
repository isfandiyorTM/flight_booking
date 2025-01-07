import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // Easy Localization import
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../../select_seat/select_seat.dart';

class SubtotalSection extends StatelessWidget {
  const SubtotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Subtotal and Amount
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppTexts.subtotal.tr(), // Easy Localization .tr() extension
                  style: const TextStyle(
                    color: AppColors.textGray,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.blue,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              AppTexts.price132.tr(), // Easy Localization .tr() extension
              style: const TextStyle(
                color: AppColors.textBlack,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        // Select Seat Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SeatBookingPage()),
            );
          },
          icon: const Icon(
            Icons.check_circle,
            color: AppColors.white,
          ),
          label: Text(
            AppTexts.selectSeat.tr(), // Easy Localization .tr() extension
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
