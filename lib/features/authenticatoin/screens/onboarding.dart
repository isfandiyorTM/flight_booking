import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../helpers/helper_functions.dart';
import '../controllers/onboarding/onboarding_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/onboarding_page_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(image: AppImages.onboardingImage1, text: AppTexts.onBoardingTitle1),
                OnboardingPage(image: AppImages.onboardingImage2, text: AppTexts.onBoardingTitle2),
                OnboardingPage(image: AppImages.onboardingImage3, text: AppTexts.onBoardingTitle3),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller.pageController,
            count: 3,
            onDotClicked: OnBoardingController.instance.dotNavigationClick,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.blue,
              dotColor: AppColors.bgLight,
              dotWidth: 21,
              dotHeight: 6,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CutomButton(
                  text: AppTexts.skip,
                  bgColor: AppColors.bgLight,
                  textColor: AppColors.textBlack,
                  icon: null,
                  width: HelperFunctions.screenWidth() * 0.4,
                  onPressed: () {
                    OnBoardingController.instance.skipPage();
                  },
                ),
                CutomButton(
                  text: AppTexts.next,
                  bgColor: AppColors.blue,
                  textColor: AppColors.white,
                  icon: const Icon(Icons.arrow_circle_right,color: AppColors.white,),
                  width: HelperFunctions.screenWidth() * 0.4,
                  onPressed: () {
                    OnBoardingController.instance.nextPage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}