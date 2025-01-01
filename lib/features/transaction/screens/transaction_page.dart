import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.back,
            color: AppColors.textBlack,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppTexts.transaction,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack),
            ).tr(),
            Image(
              image: const AssetImage(AppImages.transaction),
              width: HelperFunctions.screenWidth(),
              height: 200,
            ),
            const SizedBox(height: 50),
             SizedBox(
              width: double.infinity,
              child: const Text(
                AppTexts.letsGo,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                ),
                textAlign: TextAlign.center,
              ).tr(),
            ),
            const SizedBox(height: 10),
            const Text(
              AppTexts.letsGoSubTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGray,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blue,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppTexts.bookTrip,
                  style: TextStyle(color: AppColors.white,fontSize: 16,fontWeight: FontWeight.w500),
                ).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
