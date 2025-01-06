import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/delete_account_widget.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  bool isChecked = false;

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
              AppTexts.deleteAccount,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack),
            ).tr(),
            Image(
              image: const AssetImage(AppImages.deleteAccount),
              width: HelperFunctions.screenWidth(),
              height: 200,
            ),
            const SizedBox(height: 50),
            const Text(
              AppTexts.ifYouDeleteYourAcc,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            DeleteAccountWidget(title: AppTexts.ticketPointNoUsable,),
            DeleteAccountWidget(title: AppTexts.rewardsNotAvailable,),
            DeleteAccountWidget(title: AppTexts.rewardsWillDeleted,),
            DeleteAccountWidget(title: AppTexts.creditCardRewards,),

            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.blue,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(AppTexts.iUnderstandAndAccept, style: TextStyle(
                    color: isChecked ? AppColors.textBlack : AppColors.textGray,
                    fontWeight:FontWeight.w400,
                  ),),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Opacity(
              opacity:isChecked ? 1 : 0.1,
              child: Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blue,
                ),

                child: TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    AppTexts.yesContinue,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

