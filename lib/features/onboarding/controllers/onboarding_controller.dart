import 'package:ecommerce_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  int currentPageIndex = 0;

  //update current index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex = index;
  }

  //jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpTo(index);
  }

  //update current index and jump to next page
  void nextPage() {
    if (currentPageIndex == 2) {
      final storage = GetStorage();
      storage.write("IsFirstTime", false);
      Get.offAll(() => const LoginPage());
    } else {
      int page = currentPageIndex + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current index and jump to the last page
  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
  }
}
