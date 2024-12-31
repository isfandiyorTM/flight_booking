import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  String? labelText;
  String? hintText;

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
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: hintText!,
                hintStyle: const TextStyle(fontSize: 14,color: AppColors.textBlack,fontWeight: FontWeight.w500),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textGray),
                )
            ),

          ),
        ],
      ),
    );
  }
}
