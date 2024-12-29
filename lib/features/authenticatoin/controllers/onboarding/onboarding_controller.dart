import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authenticatoin/screens/sign_in.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance  => Get.find();

  final pageController = PageController();
  Rx currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage(){
    if(currentPageIndex == 2) {
      Get.to(SignIn());
    }
    else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage(){
    Get.to(SignIn());
  }
}