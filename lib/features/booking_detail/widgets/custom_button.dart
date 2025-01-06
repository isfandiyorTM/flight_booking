import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Handle the button click
      borderRadius: BorderRadius.circular(8), // For ripple effect with rounded corners
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textBlack,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textGray,
            ),
          ],
        ),
      ),
    );
  }
}
