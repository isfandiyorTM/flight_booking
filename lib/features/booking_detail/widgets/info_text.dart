import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "This contact is for e-ticket and refund/rescheduling",
      style: TextStyle(
        color: AppColors.textGray,
        fontSize: 12,
      ),
    );
  }
}
