import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ChooseFlightInput extends StatelessWidget {
  ChooseFlightInput(
      {super.key,
        required this.title,
        required this.hintText,
        required this.icon,
        this.onPressed,
        this.readOnly,
        this.controller
      });


  String? title;
  String? hintText;
  Icon? icon;
  VoidCallback? onPressed;
  bool? readOnly;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.textBlack,
          ),
        ).tr(),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgLight,
              border: Border.all(width: 1, color: AppColors.borderColor)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon!,
              hintText: hintText!.tr(),
              contentPadding: const EdgeInsets.only(top: 13),
              border: InputBorder.none,
            ),
            onTap: onPressed,
            readOnly: readOnly??false,
          ),
        ),
      ],
    );
  }
}
