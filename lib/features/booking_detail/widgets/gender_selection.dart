import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class GenderSelection extends StatelessWidget {
  final String gender;
  final ValueChanged<String> onGenderChanged;

  const GenderSelection({
    Key? key,
    required this.gender,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: "Male",
          groupValue: gender,
          onChanged: (String? value) {
            if (value != null) {
              onGenderChanged(value);
            }
          },
          activeColor: AppColors.blue,
        ),
        const Text("Male", style: TextStyle(color: AppColors.textBlack)),
        const SizedBox(width: 16),
        Radio<String>(
          value: "Female",
          groupValue: gender,
          onChanged: (String? value) {
            if (value != null) {
              onGenderChanged(value);
            }
          },
          activeColor: AppColors.blue,
        ),
        const Text("Female", style: TextStyle(color: AppColors.textBlack)),
      ],
    );
  }
}
