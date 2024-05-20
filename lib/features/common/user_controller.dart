import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/common/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/re_auth_page.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepo());

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = true.obs;

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  fetchUserData() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDataByID();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  savedUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameparts(userCredential.user!.displayName ?? "");

        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join("") : "",
          username: userCredential.user!.displayName ?? "",
          email: userCredential.user!.email ?? "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? "",
        );

        await userRepo.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data not Saved", message: "Something went wrong");
    }
  }

  deleteAccountPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account parmanently? This action is not reversible and all your data will be removed parmanently.",
      confirm: ElevatedButton(
          onPressed: () => deleteUser(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text("Delete"),
          )),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text("Cancel")),
    );
  }

  deleteUser() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          "We are Processing your information...",
          TImageStrings.docerAnimation);

      final auth = AuthenticationRepo.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.loginWithGoogle();
          await auth.deleteUser();

          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginPage());
        } else if (provider == "password") {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthPage());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }

  reAuthenticateUserAndDeleteUser() async {
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

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.reAuthenticateUser(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepo.instance.deleteUser();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    }
  }
}
