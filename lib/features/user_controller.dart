import 'package:ecommerce_app/common/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepo());

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
}
