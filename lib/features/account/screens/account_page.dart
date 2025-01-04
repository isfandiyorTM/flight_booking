import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/route/route_names.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../widgets/account_setting_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import '../service/get_user_data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Map<String, dynamic> userData = {
    'full_name': 'Loading...',
    'email': 'Loading...',
    'phone_number': 'Loading...',
    'profile_image_url': null,
  };

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await getUserData();
      print('User Data: $data'); // Ma'lumotlarni chop etish

      if (data != null) {
        setState(() {
          userData = {
            'full_name':
                (data['full_name'] != null && data['full_name']!.isNotEmpty)
                    ? data['full_name']
                    : AppTexts.defaultUserName,
            'email': data['email'] ?? 'example@example.com',
            'phone_number': (data['phone_number'] != null &&
                    data['phone_number']!.isNotEmpty)
                ? data['phone_number']
                : AppTexts.noPhoneNumber,
            'profile_image_url': data['profile_image_url'] ?? null,
          };
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No data found for the user')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                          ).tr(),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                foregroundImage:
                                    userData['profile_image_url'] != null
                                        ? NetworkImage(
                                            userData['profile_image_url'])
                                        : const AssetImage(
                                                AppImages.profileImage)
                                            as ImageProvider,
                                radius: 45,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData['full_name'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    userData['email'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    userData['phone_number'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/edit.png',
                                  color: AppColors.white,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
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
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.settings);
                        },
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
                  ),
                ],
              ),
            ),
    );
  }
}
