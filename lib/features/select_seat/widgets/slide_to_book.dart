import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SlideToBook extends StatelessWidget {
  const SlideToBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add booking logic here
        print("Booking confirmed");
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: const Text(
        "Slide to Book",
        style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
