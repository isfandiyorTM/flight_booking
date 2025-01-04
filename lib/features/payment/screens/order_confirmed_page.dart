import 'package:flutter/material.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';

class OrderConfirmedPage extends StatelessWidget {
  const OrderConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(AppImages.confirmedOrder)),
            const SizedBox(height: 100),
            const Text(
              AppTexts.orderConfirmed,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            const SizedBox(height: 10),
            const Text(
              AppTexts.orderConfirmedSubtitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppTexts.seeDetails,
                  style: TextStyle(color: AppColors.textBlack),
                ).tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
