import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/common/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/common/user_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  //variables

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();

  final userController = UserController.instance;
  final userRepo = Get.put(UserRepo());

  @override
  void onInit() {
    initilizeNames();
    super.onInit();
  }

  initilizeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  updateUserName() async {
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
      if (!changeNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      await userRepo.updateFieldOnUserCollection(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      await FullScreenLoader.stopLoading();
      Loaders.successSnackBar(
          title: "Success", message: "your name has been updated.");

      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }
}
