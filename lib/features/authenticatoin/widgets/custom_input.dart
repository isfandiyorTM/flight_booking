import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller, // Qo'shildi
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller; // Qo'shildi

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textGray,
              fontWeight: FontWeight.w400,
            ),
          ).tr(),
          TextFormField(
            controller: controller, // Qo'shildi
            decoration: InputDecoration(
                hintText: hintText!.tr(),
                hintStyle: const TextStyle(fontSize: 14, color: AppColors.textBlack, fontWeight: FontWeight.w500),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textGray),
                )),
          ),
        ],
      ),
    );
  }
}
