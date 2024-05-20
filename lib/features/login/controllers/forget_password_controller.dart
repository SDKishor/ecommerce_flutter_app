import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/pages/reset_password_page.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPassworController extends GetxController {
  static ForgetPassworController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          "We are Processing your information...",
          TImageStrings.docerAnimation);

      //Check internet connection

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance
          .sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: "Email Sent", message: "Email Link Sent to reset password");

      Get.to(() => ResetPasswordPage(email: email.text));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          "We are Processing your information...",
          TImageStrings.docerAnimation);

      //Check internet connection

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: "Email Sent", message: "Email Link Sent to reset password");
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }
}
