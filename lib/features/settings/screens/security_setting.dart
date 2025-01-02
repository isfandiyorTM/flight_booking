import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:t_store/features/settings/widgets/security_setting_widget.dart';
import '../../../core/constants/colors.dart';

class SecuritySettingsPage extends StatefulWidget {
  @override
  State<SecuritySettingsPage> createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  String verificationValue = AppTexts.doubleVerification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    AppTexts.securitySetting,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack,
                    ),
                  ).tr(),
                  const SizedBox(height: 30),
                  const Text(
                    AppTexts.creditCard,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ).tr(),
                  SecuritySettingWidget(
                    title: AppTexts.doubleVerification,
                    subTitle: AppTexts.verificationSubtitle,
                    trailing: Radio(
                        value: AppTexts.doubleVerification,
                        groupValue: verificationValue,
                        activeColor: AppColors.blue,
                        onChanged: (dynamic value) {
                          setState(() {
                            verificationValue = value;
                          });
                        }),
                  ),
                  SecuritySettingWidget(
                    title: AppTexts.singleVerification,
                    subTitle: AppTexts.verificationSubtitle,
                    trailing: Radio(
                        value: AppTexts.singleVerification,
                        groupValue: verificationValue,
                        activeColor: AppColors.blue,
                        onChanged: (dynamic value) {
                          setState(() {
                            verificationValue = value;
                          });
                        }),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 20,
              color: AppColors.lightGray,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppTexts.biometric,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ).tr(),
                  SecuritySettingWidget(
                    title: AppTexts.activeBiometricFeature,
                    subTitle: AppTexts.activeBiometricFeatureSubtitle,
                    trailing: Theme(
                      data: ThemeData(
                        useMaterial3: true,
                      ).copyWith(
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(outline: Colors.white),
                      ),
                      child: Switch(
                        value: true,
                        activeTrackColor: AppColors.blue,
                        inactiveTrackColor: AppColors.lightGray,
                        inactiveThumbColor: AppColors.white,
                        onChanged: (value) => setState(() => value = !value),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 20,
              color: AppColors.lightGray,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppTexts.device,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ).tr(),
                  SecuritySettingWidget(
                    title: AppTexts.setDeviceAsTrusted,
                    subTitle: AppTexts.setDeviceAsTrustedSubtitle,
                    trailing: Theme(
                      data: ThemeData(
                        useMaterial3: true,
                      ).copyWith(
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(outline: Colors.white),
                      ),
                      child: Switch(
                        value: false,
                        activeTrackColor: AppColors.blue,
                        inactiveTrackColor: AppColors.lightGray,
                        inactiveThumbColor: AppColors.white,
                        onChanged: (value) => setState(() => value = !value),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 20,
              color: AppColors.lightGray,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppTexts.pin,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ).tr(),
                  SecuritySettingWidget(
                    title: AppTexts.setPIN,
                    subTitle: AppTexts.setPINSubtitle,
                    trailing: Theme(
                      data: ThemeData(
                        useMaterial3: true,
                      ).copyWith(
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(outline: Colors.white),
                      ),
                      child: const Icon(CupertinoIcons.right_chevron,color: AppColors.textGray,),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
