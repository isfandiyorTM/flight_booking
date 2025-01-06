import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/route/route_names.dart';
import '../widgets/pin_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class PassCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.back, size: 30),
            ),
            const SizedBox(height: 100),
            const Text(
              AppTexts.passcode,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
            ).tr(),
            const SizedBox(height: 8),
            const Text(
              AppTexts.enterYourPasscode,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textGray,
                fontWeight: FontWeight.w500,
              ),
            ).tr(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: (){},
              child: const Text(
                AppTexts.forgotPassword,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ).tr(),
            ),
            const SizedBox(height: 24),
            PinInputField(
              onComplete: (pin) {
                Navigator.pushNamed(context, RouteNames.orderConfirmed);
              },
            ),
          ],
        ),
      ),
    );
  }
}

