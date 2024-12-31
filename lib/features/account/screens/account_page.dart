import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../widgets/account_setting_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppTexts.myProfile,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          foregroundImage: AssetImage(AppImages.profileImage),
                          radius: 45,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppTexts.accountName,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              AppTexts.accountEmail,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              AppTexts.accountPhone,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.white,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                AccountSettingWidget(
                  icon: const Icon(
                    Icons.navigation,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.myOrder,
                ),
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.discount_shape,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.myVoucher,
                ),
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.card,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.paymentMethods,
                ),
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.user_add,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.inviteFriends,
                ),
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.scan,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.quickLogin,
                ),
            
                Container(
                  width: double.infinity,
                  height: 20,
                  color: AppColors.lightGray,
                ),
            
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.message_question,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.myOrder,
                ),
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.setting_2,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.settings,
                ),
            
                Container(
                  width: double.infinity,
                  height: 20,
                  color: AppColors.lightGray,
                ),
            
                AccountSettingWidget(
                  icon: const Icon(
                    Iconsax.login,
                    color: AppColors.blue,
                    size: 30,
                  ),
                  title: AppTexts.logOut,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

