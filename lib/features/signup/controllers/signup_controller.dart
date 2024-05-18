import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/common/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/pages/varify_email_page.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidepassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final username = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //signup
  signup() async {
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
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must accept our privacy policy and terms of use",
        );

        FullScreenLoader.stopLoading();

        return;
      }

      //reg user and save data in firebase
      final userCredential = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save data on firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepo());

      await userRepository.saveUserRecord(newUser);
      FullScreenLoader.stopLoading();

      //show success massage
      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created. Verify email to continue");

      //Move to verify email Screen
      Get.offAll(() => VarifyEmailPage(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }
}
