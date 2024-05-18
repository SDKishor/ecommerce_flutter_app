import 'dart:async';

import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/pages/success_page.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VarifyEmailController extends GetxController {
  static VarifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVarification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVarification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVarification();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Check your email inbox and varify your email");
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Sanp!", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessPage(
            image: TImageStrings.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onpressed: AuthenticationRepo.instance.screenRedirect()));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessPage(
          image: TImageStrings.successfulPaymentIcon,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onpressed: AuthenticationRepo.instance.screenRedirect()));
    }
  }
}
