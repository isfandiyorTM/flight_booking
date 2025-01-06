import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../select_seat/select_seat.dart';

class SubtotalSection extends StatelessWidget {
  const SubtotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Subtotal and Amount
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    color: AppColors.textGray,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.blue,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "\$132",
              style: TextStyle(
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
              MaterialPageRoute(builder: (context) =>  SeatBookingApp()),
            );
          },
          icon: const Icon(
            Icons.check_circle,
            color: AppColors.white,
          ),
          label: const Text(
            "Select Seat",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue, // Button background color
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
