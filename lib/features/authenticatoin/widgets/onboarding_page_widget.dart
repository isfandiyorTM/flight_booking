import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({
    super.key,
    required this.image,
    required this.text,
  });

  String? image;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image(
            image:  AssetImage(image!),
            height: HelperFunctions.screenHeight() * 0.6,
          ),
          Text(
            text!,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
