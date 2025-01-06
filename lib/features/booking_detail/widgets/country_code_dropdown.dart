import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

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
                    "assets/icons/uk_flag.png",
                    width: 32,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "(+44)",
                    style: TextStyle(
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
