import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class DeleteAccountWidget extends StatelessWidget {
  DeleteAccountWidget({super.key, required this.title});

  String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 10,
          color: AppColors.textBlack,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlack,
            ),
          ),
        )
      ],
    );
  }
}
