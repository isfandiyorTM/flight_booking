import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/constants/text_strings.dart';
import '../../../core/constants/colors.dart';

class EmailAndMobilenumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.back, size: 30),
              ),
              const SizedBox(height: 30),
              const Text(
                AppTexts.emailAndMobileNumber,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                ),
              ).tr(),
              const SizedBox(height: 10),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Iconsax.verify),
                title: Text(
                  AppTexts.unverified,
                  style: TextStyle(color: AppColors.red),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text(
                  AppTexts.accountPhone,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ),
                trailing: Icon(Icons.edit,color: AppColors.blue,),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blue,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppTexts.enter,
                    style: TextStyle(color: AppColors.white,fontSize: 16,fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                AppTexts.emailCapitalize,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ).tr(),
              const SizedBox(height: 10),
              const Text(
                AppTexts.youWillReceive,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGray,
                ),
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
